import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pms_app/common/extensions/string_to_time.dart';

part 'teacher_schedule_view.freezed.dart';

@freezed
class TeacherScheduleView with _$TeacherScheduleView {
  const factory TeacherScheduleView({
    required int subjectGroupTimeSlotId,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required int subjectGroupId,
    required String groupName,
    required String subjectName,
    required String day,
  }) = _TeacherScheduleView;

  factory TeacherScheduleView.fromJson(Map<String, dynamic> json) {
    return TeacherScheduleView(
      subjectGroupTimeSlotId: json['subjectGroupTimeSlotId'],
      startTime: json['startTime'].toString().toDayTime(),
      endTime: json['endTime'].toString().toDayTime(),
      subjectGroupId: json['subjectGroupId'],
      groupName: json['groupName'],
      subjectName: json['subjectName'],
      day: json['day'],
    );
  }
}
