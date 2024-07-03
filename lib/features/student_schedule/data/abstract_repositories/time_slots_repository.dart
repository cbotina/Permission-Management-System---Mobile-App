import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/features/student_schedule/domain/models/time_slot.dart';

abstract class ITimeSlotsRepository {
  Future<Pagination<TimeSlot>> getPaginatedTimeSlots(
    int periodId,
    int page,
    String searchQuery,
  );
}
