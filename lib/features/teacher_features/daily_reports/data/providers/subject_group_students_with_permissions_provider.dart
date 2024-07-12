import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/providers/daily_report_permissions_provider.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/providers/subject_group_students_provider.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/daily_report_permission_view.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/student_with_permission.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/domain/models/schedule_with_daily_report.dart';

final subjectGroupStudentsWithPermissionsProvider =
    FutureProvider.family<List<StudentWithPermission>, ScheduleWithDailyReport>(
        (
  ref,
  scheduleWithDailyReport,
) async {
  final subjectGroupId = scheduleWithDailyReport.scheduleView.subjectGroupId;

  // en provider
  final students2 = ref.watch(subjectGroupStudentsProvider(subjectGroupId));

  List studentPermissions;

  if (scheduleWithDailyReport.dailyReportView == null) {
    studentPermissions = [];
  } else {
    final dailyReportId =
        scheduleWithDailyReport.dailyReportView!.dailyReportId;

    studentPermissions =
        ref.watch(dailyReportPermissionsProvider(dailyReportId)).asData!.value;

    print(studentPermissions);
    // studentPermissions = await ref
    //     .watch(dailyReportPermissionsRepositoryProvider)
    //     .getDailyReportPermissions(dailyReportId);
  }

  return students2.when(
    data: (data) {
      return data.map((e) {
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
    },
    error: (error, stackTrace) => throw error,
    loading: () => [],
  );
});
