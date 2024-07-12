import 'package:pms_app/features/student_features/student_schedule/domain/models/time_slot.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/domain/models/teacher_schedule_view.dart';

class TimeSlotWithTeacherSchedule {
  final TimeSlot timeSlot;
  final TeacherScheduleView? teacherSchedule;

  TimeSlotWithTeacherSchedule({
    required this.timeSlot,
    this.teacherSchedule,
  });
}
