import 'dart:convert';
import 'dart:io';

import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/features/users/data/abstract_repositories/users_repository.dart';
import 'package:pms_app/features/users/data/dto/change_password_dto.dart';
import 'package:http/http.dart' as http;

class ImplUsersRepository implements IUsersRepository {
  @override
  Future<void> changePasword(int userId, ChangePasswordDto dto) async {
    final uri = Uri.parse('${ENV.backendUrl}/users/$userId/change-password');

    final response = await http.patch(
      uri,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode(dto),
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode != 200) {
      switch (response.statusCode) {
        case 400:
          throw Exception(
              'La nueva contraseña no es segura. Debe tener al menos 8 caracteres, mayúsculas, minúsculas y símbolos especiales (#, !, @, etc)');
        case 401:
          throw Exception('La contraseña actual no es correcta');
      }
    }
  }
}
