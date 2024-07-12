import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pms_app/features/student_features/student_permissions/domain/models/permission.dart';

part 'daily_report_permission_view.freezed.dart';
part 'daily_report_permission_view.g.dart';

@freezed
class DailyReportPermissionView with _$DailyReportPermissionView {
  const factory DailyReportPermissionView({
    required int dailyReportId,
    required int absenceId,
    required int studentId,
    required String studentName,
    required String permissionReason,
    required PermissionStatus permissionStatus,
    required int permissionId,
  }) = _DailyReportPermissionView;

  factory DailyReportPermissionView.fromJson(Map<String, dynamic> json) =>
      _$DailyReportPermissionViewFromJson(json);
}
