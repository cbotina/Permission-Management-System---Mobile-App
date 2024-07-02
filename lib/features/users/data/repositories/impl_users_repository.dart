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
      throw Exception(jsonResponse['message']);
    }
  }
}
