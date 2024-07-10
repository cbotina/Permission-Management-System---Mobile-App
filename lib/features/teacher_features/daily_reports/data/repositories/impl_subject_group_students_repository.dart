import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/errors/session_expired_error.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/abstract_repositories/subject_group_students_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/subject_group_students_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImplSubjectGroupStudentsRepository
    implements ISubjectGroupStudentsRepository {
  final ProviderRef ref;

  ImplSubjectGroupStudentsRepository({required this.ref});

  @override
  Future<List<SubjectGroupStudentsView>> getSubjectGroupStudents(
    int subjectGroupId,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final uri =
        Uri.parse('${ENV.backendUrl}/subject-groups/$subjectGroupId/students');

    log(uri.toString());
    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    log(response.body.toString());

    if (response.statusCode == 401) {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }

    if (response.statusCode != 200) {
      throw Exception(jsonDecode(response.body)['message']);
    }

    final jsonResponse = jsonDecode(response.body) as List<dynamic>;

    return jsonResponse
        .map((e) => SubjectGroupStudentsView.fromJson(e))
        .toList();
  }
}
