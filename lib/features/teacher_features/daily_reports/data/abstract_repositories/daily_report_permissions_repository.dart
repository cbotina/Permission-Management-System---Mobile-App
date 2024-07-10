import 'package:pms_app/features/teacher_features/daily_reports/domain/models/daily_report_permission_view.dart';

abstract class IDailyReportPermissionsRepository {
  Future<List<DailyReportPermissionView>> getDailyReportPermissions(
    int dailyReportId,
  );
}
