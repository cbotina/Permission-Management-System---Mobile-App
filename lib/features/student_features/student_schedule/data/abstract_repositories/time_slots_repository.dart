import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/features/student_features/student_schedule/domain/models/time_slot.dart';

abstract class ITimeSlotsRepository {
  Future<Pagination<TimeSlot>> getPeriodTimeSlots(
    int periodId,
  );
}
