import 'dart:convert';
import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/common/models/response_metadata.dart';
import 'package:pms_app/common/utils/query_params_builder.dart';
import 'package:pms_app/features/student_permissions/data/abstract_repositories/permission_repository.dart';
import 'package:pms_app/features/student_permissions/domain/models/permission.dart';
import 'package:http/http.dart' as http;

class ImplPermissionsRepository implements IPermissionsRepository {
  @override
  Future<Pagination<Permission>> getStudentPeriodPermissions(
    int periodId,
    int studentId,
    int page,
  ) async {
    final queryParams = buildQueryParams({'page': '$page'});

    final uri = Uri.parse(
        "${ENV.backendUrl}/periods/$periodId/students/$studentId/permissions$queryParams");

    final response = await http.get(uri);

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final jsonItems = jsonResponse['items'] as List<dynamic>;
    final items = jsonItems.map((e) => Permission.fromJson(e)).toList();
    final meta = ResponseMetadata.fromJson(jsonResponse['meta']);

    return Pagination(items: items, meta: meta);
  }
}
