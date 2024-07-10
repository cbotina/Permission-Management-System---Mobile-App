import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/errors/session_expired_error.dart';
import 'package:pms_app/common/utils/query_params_builder.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/abstract_repositories/teacher_daily_reports_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/teacher_daily_report_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ImplTeacherDailyReportsRepository
    implements ITeacherDailyReportsRepository {
  final ProviderRef ref;

  ImplTeacherDailyReportsRepository({required this.ref});

  @override
  Future<List<TeacherDailyReportView>> getTeacherDailyReports(
    int periodId,
    int teacherId,
    String date,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final queryParams = buildQueryParams({'date': date});

    final uri = Uri.parse(
        '${ENV.backendUrl}/periods/$periodId/teachers/$teacherId/daily-reports$queryParams');

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

    return jsonResponse.map((e) => TeacherDailyReportView.fromJson(e)).toList();
  }
}
