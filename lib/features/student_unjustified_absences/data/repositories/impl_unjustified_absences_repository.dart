import 'dart:convert';

import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/common/models/response_metadata.dart';
import 'package:pms_app/common/utils/query_params_builder.dart';
import 'package:pms_app/features/student_unjustified_absences/data/abstract_repositories/unjustified_absences_repository.dart';
import 'package:pms_app/features/student_unjustified_absences/domain/models/unjustified_absence_details_view.dart';
import 'package:http/http.dart' as http;

class ImplUnjustifiedAbsencesRepository
    implements IUnjustifiedAbsencesRepository {
  @override
  Future<Pagination<UnjustifiedAbsenceDetailsView>>
      getStudentUnjustifiedAbsences(
    int periodId,
    int studentId,
    int page,
  ) async {
    final queryParams = buildQueryParams({'page': '$page'});

    final uri = Uri.parse(
        "${ENV.backendUrl}/periods/$periodId/students/$studentId/absences/unjustified$queryParams");

    final response = await http.get(uri);

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final jsonItems = jsonResponse['items'] as List<dynamic>;
    final items = jsonItems
        .map((e) => UnjustifiedAbsenceDetailsView.fromJson(e))
        .toList();
    final meta = ResponseMetadata.fromJson(jsonResponse['meta']);

    return Pagination(items: items, meta: meta);
  }
}
