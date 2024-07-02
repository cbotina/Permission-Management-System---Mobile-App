import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pms_app/common/extensions/string_to_permission_status.dart';
import 'package:pms_app/common/extensions/string_to_time.dart';
import 'package:pms_app/features/student_permissions/domain/models/permission.dart';

part 'unjustified_absence_details_view.freezed.dart';

@freezed
class UnjustifiedAbsenceDetailsView with _$UnjustifiedAbsenceDetailsView {
  const factory UnjustifiedAbsenceDetailsView({
    required int absenceId,
    required DateTime absenceDate,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required String? teacherNote,
    required String subjectName,
    required PermissionStatus permissionStatus,
  }) = _UnjustifiedAbsenceDetailsView;

  factory UnjustifiedAbsenceDetailsView.fromJson(Map<String, dynamic> json) {
    return UnjustifiedAbsenceDetailsView(
      absenceId: json['absenceId'],
      absenceDate: DateTime.parse(json['absenceDate']),
      startTime: json['startTime'].toString().toDayTime(),
      endTime: json['endTime'].toString().toDayTime(),
      teacherNote: json['teacherNote'],
      subjectName: json['subjectName'],
      permissionStatus:
          json['permissionStatus'].toString().toPermissionStatus(),
    );
  }
}
