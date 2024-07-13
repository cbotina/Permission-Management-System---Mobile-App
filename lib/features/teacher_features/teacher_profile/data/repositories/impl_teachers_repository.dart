import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/errors/session_expired_error.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_app/features/teacher_features/teacher_profile/data/abstract_repositories/teachers_repository.dart';
import 'package:pms_app/features/teacher_features/teacher_profile/domain/models/teacher.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ImplTeachersRepository implements ITeachersRepository {
  final ProviderRef ref;

  ImplTeachersRepository({required this.ref});

  @override
  Future<Teacher> getTeacher(int teacherId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final uri = Uri.parse("${ENV.backendUrl}/teachers/$teacherId");

    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    log(response.body);

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonResponse['message'] == 'Unauthorized') {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }

    if (response.statusCode != 200) {
      throw Exception(jsonResponse['messsage']);
    }

    return Teacher.fromJson(jsonResponse);
  }
}
