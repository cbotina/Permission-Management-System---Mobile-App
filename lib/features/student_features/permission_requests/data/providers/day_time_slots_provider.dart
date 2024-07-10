import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/student_features/permission_requests/data/dto/schedule_range_dates_dto.dart';
import 'package:pms_app/features/student_features/permission_requests/domain/models/day_time_slots.dart';
import 'package:pms_app/features/session/data/providers/active_period_id_provider.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';

final dayTimeSlotsProvider =
    FutureProvider.family<List<DayTimeSlots>, ScheduleRangeDatesDto?>(
        (ref, dto) async {
  final periodId = ref.watch(activePeriodIdProvider);
  final studentId = ref.watch(entityIdProvider);

  if (dto == null) {
    return [];
  }

  return await ref
      .read(dayTimeSlotsRepositoryProvider)
      .getRangeTimeSlots(periodId, studentId, dto);
});
