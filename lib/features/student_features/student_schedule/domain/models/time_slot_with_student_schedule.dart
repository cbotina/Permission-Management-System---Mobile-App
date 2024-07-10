import 'package:pms_app/features/student_features/permission_requests/domain/models/student_schedule_view.dart';
import 'package:pms_app/features/student_features/student_schedule/domain/models/time_slot.dart';

class TimeSlotWithStudentSchedule {
  final TimeSlot timeSlot;
  final StudentScheduleView? studentSchedule;

  TimeSlotWithStudentSchedule({
    required this.timeSlot,
    this.studentSchedule,
  });
}
