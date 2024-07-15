import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/errors/session_expired_error.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_app/features/users/data/abstract_repositories/users_repository.dart';
import 'package:pms_app/features/users/data/dto/change_password_dto.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ImplUsersRepository implements IUsersRepository {
  final ProviderRef ref;

  ImplUsersRepository({required this.ref});

  @override
  Future<void> changePasword(int userId, ChangePasswordDto dto) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final uri = Uri.parse('${ENV.backendUrl}/users/$userId/change-password');

    log(uri.toString());
    final response = await http.patch(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      body: jsonEncode(dto),
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonResponse['message'] == 'Unauthorized') {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }

    log(response.body.toString());

    if (response.statusCode != 200) {
      switch (response.statusCode) {
        case 400:
          throw Exception(
              'La nueva contraseña no es segura. Debe tener al menos 8 caracteres, mayúsculas, minúsculas y símbolos especiales (#, !, @, etc)');
        case 401:
          throw Exception('La contraseña actual no es correcta');
        default:
          log(response.body.toString());
          throw Exception('Error en el servidor. Porfavor intente más tarde');
      }
    }
  }
}
