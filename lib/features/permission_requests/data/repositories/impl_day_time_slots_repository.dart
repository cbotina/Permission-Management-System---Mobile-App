import 'dart:convert';

import 'package:pms_app/common/environment/environment.dart';
import 'package:pms_app/common/utils/query_params_builder.dart';
import 'package:pms_app/features/permission_requests/data/abstract_repositories/day_time_slots_repository.dart';
import 'package:pms_app/features/permission_requests/data/dto/schedule_range_dates_dto.dart';
import 'package:pms_app/features/permission_requests/domain/models/day_time_slots.dart';
import 'package:http/http.dart' as http;

class ImplDayTimeSlotsRepository implements IDayTimeSlotsRepository {
  @override
  Future<List<DayTimeSlots>> getRangeTimeSlots(
    int periodId,
    int studentId,
    ScheduleRangeDatesDto dto,
  ) async {
    final queryParams = buildQueryParams({
      "startDate": dto.startDate.toString(),
      "endDate": dto.endDate.toString(),
    });

    final uri = Uri.parse(
        "${ENV.backendUrl}/periods/$periodId/students/$studentId/range-schedule/$queryParams");

    final response = await http.get(uri);

    final jsonResponse = jsonDecode(response.body) as List<dynamic>;

    return jsonResponse.map((e) => DayTimeSlots.fromJson(e)).toList();
  }
}
