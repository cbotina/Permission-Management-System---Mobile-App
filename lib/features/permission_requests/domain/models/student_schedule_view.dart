import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_schedule_view.freezed.dart';

@freezed
class StudentScheduleView with _$StudentScheduleView {
  const factory StudentScheduleView({
    required int subjectGroupTimeSlotId,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required String subjectName,
    required String day,
  }) = _StudentScheduleView;
}
