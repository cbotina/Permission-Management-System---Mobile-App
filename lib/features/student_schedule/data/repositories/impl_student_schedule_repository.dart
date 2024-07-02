import 'dart:convert';

import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/utils/query_params_builder.dart';
import 'package:pms_app/features/permission_requests/domain/models/student_schedule_view.dart';
import 'package:pms_app/features/student_schedule/data/abstract_repositories/student_schedule_repository.dart';
import 'package:http/http.dart' as http;

class ImplStudentScheduleRepository implements IStudentScheduleRepository {
  @override
  Future<List<StudentScheduleView>> getStudentSchedule(
    int periodId,
    int studentId,
    String day,
  ) async {
    final queryParams = buildQueryParams({
      'day': day,
    });

    final uri = Uri.parse(
        "${ENV.backendUrl}/periods/$periodId/students/$studentId/schedule$queryParams");

    final response = await http.get(uri);

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final jsonItems = jsonResponse['items'] as List<dynamic>;

    return jsonItems.map((e) => StudentScheduleView.fromJson(e)).toList();
  }
}
