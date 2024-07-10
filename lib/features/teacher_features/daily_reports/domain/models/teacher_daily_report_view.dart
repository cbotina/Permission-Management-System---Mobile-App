import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pms_app/common/extensions/string_to_time.dart';

part 'teacher_daily_report_view.freezed.dart';

@freezed
class TeacherDailyReportView with _$TeacherDailyReportView {
  const factory TeacherDailyReportView({
    required int dailyReportId,
    required int subjectGroupTimeSlotId,
    required int subjectGroupId,
    required DateTime reportDate,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required String subjectName,
    required String groupName,
    required bool isSubmitted,
  }) = _TeacherDailyReportView;

  factory TeacherDailyReportView.fromJson(Map<String, dynamic> json) {
    return TeacherDailyReportView(
      dailyReportId: json['dailyReportId'],
      subjectGroupTimeSlotId: json['subjectGroupTimeSlotId'],
      subjectGroupId: json['subjectGroupId'],
      reportDate: DateTime.parse(json['reportDate']),
      startTime: json['startTime'].toString().toDayTime(),
      endTime: json['endTime'].toString().toDayTime(),
      subjectName: json['subjectName'],
      groupName: json['groupName'],
      isSubmitted: json['isSubmitted'] == 1 ? true : false,
    );
  }
}
