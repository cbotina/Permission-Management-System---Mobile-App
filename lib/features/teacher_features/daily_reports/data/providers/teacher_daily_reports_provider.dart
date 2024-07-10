// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:pms_app/common/providers/repository_providers.dart';
// import 'package:pms_app/features/session/data/providers/active_period_id_provider.dart';
// import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';
// import 'package:pms_app/features/teacher_features/daily_reports/domain/models/teacher_daily_report_view.dart';

// final teacherDailyReportsProvider =
//     FutureProvider<List<TeacherDailyReportView>>((ref) async {
//   final periodId = ref.watch(activePeriodIdProvider);

//   final teacherId = ref.watch(entityIdProvider);

//   final date = DateTime.now();

//   return await ref
//       .watch(teacherDailyReportsRepositoryProvider)
//       .getTeacherDailyReports(periodId, teacherId, date);
// });
