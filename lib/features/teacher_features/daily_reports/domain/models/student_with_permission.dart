import 'package:pms_app/features/teacher_features/daily_reports/domain/models/daily_report_permission_view.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/subject_group_students_view.dart';

class StudentWithPermission {
  final SubjectGroupStudentsView student;
  final DailyReportPermissionView? permission;

  StudentWithPermission({
    required this.student,
    this.permission,
  });
}
