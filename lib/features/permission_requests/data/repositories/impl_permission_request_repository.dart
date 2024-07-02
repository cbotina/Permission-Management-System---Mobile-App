import 'dart:convert';
import 'dart:io';

import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/features/permission_requests/data/abstract_repositories/permission_request_repository.dart';
import 'package:pms_app/features/permission_requests/data/dto/permission_request_dto.dart';
import 'package:http/http.dart' as http;

class ImplPermissionRequestRepository implements IPermissionRequestRepository {
  @override
  Future<void> createPermissionRequest(
    int studentId,
    PermissionRequestDto dto,
  ) async {
    final uri = Uri.parse('${ENV.backendUrl}/students/$studentId/permissions');

    final response = await http.post(
      uri,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode(dto),
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode != 201) {
      throw Exception(jsonResponse['message']);
    }
  }
}
