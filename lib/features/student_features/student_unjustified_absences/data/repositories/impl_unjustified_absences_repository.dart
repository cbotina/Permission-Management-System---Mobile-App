import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/errors/session_expired_error.dart';
import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/common/models/response_metadata.dart';
import 'package:pms_app/common/utils/query_params_builder.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/abstract_repositories/unjustified_absences_repository.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/dto/justify_absences_request_dto.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/domain/models/unjustified_absence_details_view.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ImplUnjustifiedAbsencesRepository
    implements IUnjustifiedAbsencesRepository {
  final ProviderRef ref;

  ImplUnjustifiedAbsencesRepository({required this.ref});

  @override
  Future<Pagination<UnjustifiedAbsenceDetailsView>>
      getStudentUnjustifiedAbsences(
    int periodId,
    int studentId,
    int page,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final queryParams = buildQueryParams({'page': '$page'});

    final uri = Uri.parse(
        "${ENV.backendUrl}/periods/$periodId/students/$studentId/absences/unjustified$queryParams");

    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode != 200) {
      throw Exception(jsonResponse['message']);
    }

    if (jsonResponse['message'] == 'Unauthorized') {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }

    final jsonItems = jsonResponse['items'] as List<dynamic>;

    final items = jsonItems
        .map((e) => UnjustifiedAbsenceDetailsView.fromJson(e))
        .toList();
    final meta = ResponseMetadata.fromJson(jsonResponse['meta']);

    return Pagination(items: items, meta: meta);
  }

  @override
  Future<void> justifyStudentAbsences(
    int studentId,
    JustifyAbsencesRequestDto dto,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final uri =
        Uri.parse('${ENV.backendUrl}/students/$studentId/justify-absences');
    log(uri.toString());
    final response = await http.post(
      uri,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
      body: jsonEncode(dto),
    );

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    log(response.body.toString());
    if (response.statusCode != 201) {
      throw Exception(jsonResponse['message']);
    }

    if (jsonResponse['message'] == 'Unauthorized') {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }
  }

  @override
  Future<List<UnjustifiedAbsenceDetailsView>> getJustifiableAbsences(
    int periodId,
    int studentId,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final uri = Uri.parse(
        "${ENV.backendUrl}/periods/$periodId/students/$studentId/absences/justificable");

    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    if (response.statusCode != 200) {
      throw Exception('Ha ocurrido un error');
    }

    if (response.statusCode == 401) {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }

    final jsonResponse = jsonDecode(response.body) as List<dynamic>;

    return jsonResponse
        .map((e) => UnjustifiedAbsenceDetailsView.fromJson(e))
        .toList();
  }
}
