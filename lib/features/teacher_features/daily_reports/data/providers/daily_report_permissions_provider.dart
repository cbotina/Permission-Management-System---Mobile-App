import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/daily_report_permission_view.dart';

final dailyReportPermissionsProvider =
    FutureProvider.family<List<DailyReportPermissionView>, int>(
        (ref, dailyReportId) async {
  return await ref
      .watch(dailyReportPermissionsRepositoryProvider)
      .getDailyReportPermissions(dailyReportId);
});
