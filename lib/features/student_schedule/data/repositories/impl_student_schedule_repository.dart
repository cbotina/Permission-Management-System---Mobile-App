import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/errors/session_expired_error.dart';
import 'package:pms_app/common/utils/query_params_builder.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_app/features/permission_requests/domain/models/student_schedule_view.dart';
import 'package:pms_app/features/student_schedule/data/abstract_repositories/student_schedule_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ImplStudentScheduleRepository implements IStudentScheduleRepository {
  final ProviderRef ref;

  ImplStudentScheduleRepository({required this.ref});

  @override
  Future<List<StudentScheduleView>> getStudentSchedule(
    int periodId,
    int studentId,
    String day,
  ) async {
    final queryParams = buildQueryParams({
      'day': day,
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final uri = Uri.parse(
        "${ENV.backendUrl}/periods/$periodId/students/$studentId/schedule$queryParams");

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

    return jsonItems.map((e) => StudentScheduleView.fromJson(e)).toList();
  }
}
