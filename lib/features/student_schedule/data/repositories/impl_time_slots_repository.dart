import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/common/models/response_metadata.dart';
import 'package:pms_app/common/utils/query_params_builder.dart';
import 'package:pms_app/features/student_schedule/data/abstract_repositories/time_slots_repository.dart';
import 'package:pms_app/features/student_schedule/domain/models/time_slot.dart';

class ImplTimeSlotsRepository implements ITimeSlotsRepository {
  @override
  Future<Pagination<TimeSlot>> getPeriodTimeSlots(
    int periodId,
  ) async {
    final queryParams = buildQueryParams({'page': '1', 'limit': '16'});

    final uri = Uri.parse(
        '${ENV.backendUrl}/periods/$periodId/time-slots/$queryParams');

    final response = await http.get(uri);

    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final jsonItems = jsonResponse['items'] as List<dynamic>;
    final items = jsonItems.map((e) => TimeSlot.fromJson(e)).toList();
    final meta = ResponseMetadata.fromJson(jsonResponse['meta']);

    return Pagination(items: items, meta: meta);
  }
}
