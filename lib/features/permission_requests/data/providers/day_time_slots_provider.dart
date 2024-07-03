import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/permission_requests/data/dto/schedule_range_dates_dto.dart';
import 'package:pms_app/features/permission_requests/domain/models/day_time_slots.dart';

final dayTimeSlotsProvider =
    FutureProvider.family<List<DayTimeSlots>, ScheduleRangeDatesDto?>(
        (ref, dto) async {
  const periodId = 1;
  const studentId = 1;

  if (dto == null) {
    return [];
  }

  return await ref
      .read(dayTimeSlotsRepositoryProvider)
      .getRangeTimeSlots(periodId, studentId, dto);
});
