import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/extensions/int_to_day_string.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/session/data/providers/active_period_id_provider.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/teacher_daily_report_view.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/domain/models/schedule_with_daily_report.dart';

final scheduleWithDailyReportsProvider =
    FutureProvider.family<List<ScheduleWithDailyReport>, DateTime>(
        (ref, date) async {
  final periodId = ref.watch(activePeriodIdProvider);

  final teacherId = ref.watch(entityIdProvider);

  final schedule = await ref
      .watch(teacherScheduleRepositoryProvider)
      .getTeacherSchedule(periodId, teacherId, date.weekday.toDayString());

  final reports = await ref
      .watch(teacherDailyReportsRepositoryProvider)
      .getTeacherDailyReports(
          periodId, teacherId, date.toString().substring(0, 10));

  return schedule.map((e) {
    TeacherDailyReportView? dailyReportView;
    for (var report in reports) {
      if (report.subjectGroupTimeSlotId == e.subjectGroupTimeSlotId) {
        dailyReportView = report;
      }
    }
    return ScheduleWithDailyReport(
      scheduleView: e,
      dailyReportView: dailyReportView,
    );
  }).toList();

  // return schedule.when(
  //   data: (data) {
  //     return data.map((e) {
  //       TeacherDailyReportView? dailyReportView;
  //       for (var report in reports) {
  //         if (report.subjectGroupTimeSlotId == e.subjectGroupTimeSlotId) {
  //           dailyReportView = report;
  //         }
  //       }
  //       return ScheduleWithDailyReport(
  //         scheduleView: e,
  //         dailyReportView: dailyReportView,
  //       );
  //     }).toList();
  //   },
  //   error: (error, stackTrace) {
  //     print(error);
  //     return [];
  //   },
  //   loading: () => [],
  // );
});
