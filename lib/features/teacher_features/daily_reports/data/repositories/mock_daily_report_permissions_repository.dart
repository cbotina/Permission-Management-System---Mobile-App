import 'package:pms_app/features/teacher_features/daily_reports/data/abstract_repositories/daily_report_permissions_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/daily_report_permission_view.dart';

class MockDailyReportPermissionsRepository
    implements IDailyReportPermissionsRepository {
  @override
  Future<List<DailyReportPermissionView>> getDailyReportPermissions(
      int dailyReportId) async {
    return [];
  }
}
