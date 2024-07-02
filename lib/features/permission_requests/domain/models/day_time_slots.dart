import 'package:freezed_annotation/freezed_annotation.dart';
import 'student_schedule_view.dart';

part 'day_time_slots.freezed.dart';

@freezed
class DayTimeSlots with _$DayTimeSlots {
  const factory DayTimeSlots({
    required String date,
    required List<StudentScheduleView> subjectGroupTimeSlots,
  }) = _DayTimeSlots;
}
