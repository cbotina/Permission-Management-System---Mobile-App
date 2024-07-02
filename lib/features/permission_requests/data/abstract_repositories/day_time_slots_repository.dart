import 'package:pms_app/features/permission_requests/domain/models/day_time_slots.dart';

abstract class IDayTimeSlotsRepository {
  Future<List<DayTimeSlots>> getAll(DateTime startDate, DateTime endDate);
}
