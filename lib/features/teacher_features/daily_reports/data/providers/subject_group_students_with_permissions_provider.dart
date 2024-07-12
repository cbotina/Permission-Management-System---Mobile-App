import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/daily_report_permission_view.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/student_with_permission.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/domain/models/schedule_with_daily_report.dart';

final subjectGroupStudentsWithPermissionsProvider =
    FutureProvider.family<List<StudentWithPermission>, ScheduleWithDailyReport>(
        (
  ref,
  scheduleWithDailyReport,
) async {
  final students = await ref
      .watch(subjectGroupStudentsRepositoryProvider)
      .getSubjectGroupStudents(1);

  List studentPermissions;

  if (scheduleWithDailyReport.dailyReportView == null) {
    studentPermissions = [];
  } else {
    studentPermissions = await ref
        .watch(dailyReportPermissionsRepositoryProvider)
        .getDailyReportPermissions(
          scheduleWithDailyReport.dailyReportView!.dailyReportId,
        );
  }

  return students.map((e) {
    DailyReportPermissionView? permissionView;
    for (var permission in studentPermissions) {
      if (e.studentId == permission.studentId) {
        permissionView = permission;
      }
    }
    return StudentWithPermission(
      student: e,
      permission: permissionView,
    );
  }).toList();
});
