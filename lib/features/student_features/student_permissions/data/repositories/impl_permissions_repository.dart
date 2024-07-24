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
import 'package:pms_app/features/student_features/student_permissions/data/abstract_repositories/permission_repository.dart';
import 'package:pms_app/features/student_features/student_permissions/domain/models/permission.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ImplPermissionsRepository implements IPermissionsRepository {
  final ProviderRef ref;

  ImplPermissionsRepository({required this.ref});

  @override
  Future<Pagination<Permission>> getStudentPeriodPermissions(
    int periodId,
    int studentId,
    int page,
    String status,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final queryParams = buildQueryParams({
      'page': '$page',
      'status': status,
    });

    final uri = Uri.parse(
        "${ENV.backendUrl}/periods/$periodId/students/$studentId/permissions/$queryParams");

    log(uri.toString());

    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    log(response.body.toString());

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (jsonResponse['message'] == 'Unauthorized') {
      await ref.read(authControllerProvider.notifier).logout();
      throw SessionExpiredError('Sesión expirada. Vuelva a Iniciar Sesión');
    }

    if (response.statusCode != 200) {
      print("error");
      throw Exception(jsonResponse['messsage']);
    }

    final jsonItems = jsonResponse['items'] as List<dynamic>;
    final items = jsonItems.map((e) => Permission.fromJson(e)).toList();
    final meta = ResponseMetadata.fromJson(jsonResponse['meta']);

    return Pagination(items: items, meta: meta);
  }
}
