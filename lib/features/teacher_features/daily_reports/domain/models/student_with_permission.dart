import 'package:flutter/foundation.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/daily_report_permission_view.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/subject_group_students_view.dart';

@immutable
class StudentWithPermission {
  final SubjectGroupStudentsView student;
  final DailyReportPermissionView? permission;

  const StudentWithPermission({
    required this.student,
    this.permission,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentWithPermission &&
        other.student == student &&
        other.permission == permission;
  }

  @override
  int get hashCode => student.hashCode ^ permission.hashCode;
}
