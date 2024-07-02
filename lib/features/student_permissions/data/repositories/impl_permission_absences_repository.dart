import 'dart:convert';

import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/common/models/response_metadata.dart';
import 'package:pms_app/common/utils/query_params_builder.dart';
import 'package:pms_app/features/student_permissions/data/abstract_repositories/permission_absences_repository.dart';
import 'package:pms_app/features/student_permissions/domain/models/permission_absence_view.dart';
import 'package:http/http.dart' as http;

class ImplPermissionAbsencesRepository
    implements IPermissionAbsencesRepository {
  @override
  Future<Pagination<PermissionAbsenceView>> getStudentPermissionAbsences(
    int studentId,
    int permissionId,
    int page,
  ) async {
    final queryParams = buildQueryParams({'page': '$page'});

    final uri = Uri.parse(
        "${ENV.backendUrl}/students/$studentId/permissions/$permissionId/absences$queryParams");

    final response = await http.get(uri);

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final jsonItems = jsonResponse['items'] as List<dynamic>;
    final items =
        jsonItems.map((e) => PermissionAbsenceView.fromJson(e)).toList();
    final meta = ResponseMetadata.fromJson(jsonResponse['meta']);

    return Pagination(items: items, meta: meta);
  }
}
