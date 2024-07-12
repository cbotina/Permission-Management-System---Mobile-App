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

// final List<DailyReportPermissionView> mockDailyReportPermissions = [
//   const DailyReportPermissionView(
//     dailyReportId: 20,
//     absenceId: 28,
//     studentId: 35,
//     studentName: "Bastidas Erazo Nicol Alejandra",
//     permissionReason: "Cita medica",
//     permissionStatus: "P",
//     permissionId: 12,
//   ),
//   const DailyReportPermissionView(
//     dailyReportId: 20,
//     absenceId: 29,
//     studentId: 38,
//     studentName: "Bravo Martinez Juan Andres",
//     permissionReason: "Enfermedad",
//     permissionStatus: "P",
//     permissionId: 13,
//   ),
// ];
