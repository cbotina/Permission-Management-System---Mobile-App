import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/errors/session_expired_error.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/abstract_repositories/daily_reports_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/dto/create_daily_report_dto.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ImplDailyReportsRepository implements IDailyReportsRepository {
  final ProviderRef ref;

  ImplDailyReportsRepository({required this.ref});

  @override
  Future<void> createDailyReport(CreateDailyReportDto dto) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final uri = Uri.parse('${ENV.backendUrl}/daily-reports');

    final response = await http.post(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      body: jsonEncode(dto),
    );

    log(response.body.toString());

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonResponse['message'] == 'Unauthorized') {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }

    if (response.statusCode != 201) {
      log(response.statusCode.toString());
      throw Exception(jsonResponse['message']);
    }
  }
}
