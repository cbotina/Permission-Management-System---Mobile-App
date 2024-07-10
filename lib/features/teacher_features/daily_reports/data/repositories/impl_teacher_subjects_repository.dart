import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/errors/session_expired_error.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/abstract_repositories/teacher_subjects_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/teacher_subjects_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ImplTeacherSubjectsRepository implements ITeacherSubjectsRepository {
  final ProviderRef ref;

  ImplTeacherSubjectsRepository({required this.ref});

  @override
  Future<List<TeacherSubjectsView>> getTeacherSubjectGroups(
    int periodId,
    int teacherId,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final uri = Uri.parse(
        "${ENV.backendUrl}/periods/$periodId/teachers/$teacherId/subject-groups");

    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonResponse['message'] == 'Unauthorized') {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }

    if (response.statusCode != 200) {
      throw Exception(jsonResponse['messsage']);
    }

    final jsonItems = jsonResponse['items'] as List<dynamic>;

    return jsonItems.map((e) => TeacherSubjectsView.fromJson(e)).toList();
  }
}
