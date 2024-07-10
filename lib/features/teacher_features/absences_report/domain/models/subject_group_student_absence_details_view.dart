import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pms_app/common/extensions/string_to_time.dart';

part 'subject_group_student_absence_details_view.freezed.dart';

@freezed
class SubjectGroupStudentAbsenceDetailsView
    with _$SubjectGroupStudentAbsenceDetailsView {
  const factory SubjectGroupStudentAbsenceDetailsView({
    required int absenceId,
    required DateTime absenceDate,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required String? teacherNote,
    required String permissionStatus,
  }) = _SubjectGroupStudentAbsenceDetailsView;

  factory SubjectGroupStudentAbsenceDetailsView.fromJson(
      Map<String, dynamic> json) {
    return SubjectGroupStudentAbsenceDetailsView(
      absenceId: json['absenceId'],
      absenceDate: DateTime.parse(json['absenceDate']),
      startTime: json['startTime'].toString().toDayTime(),
      endTime: json['endTime'].toString().toDayTime(),
      teacherNote: json['teacherNote'],
      permissionStatus: json['permissionStatus'],
    );
  }
}
