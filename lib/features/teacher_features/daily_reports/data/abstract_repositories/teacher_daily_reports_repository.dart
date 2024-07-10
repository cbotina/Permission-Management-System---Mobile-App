import 'package:pms_app/features/teacher_features/daily_reports/domain/models/teacher_daily_report_view.dart';

abstract class ITeacherDailyReportsRepository {
  Future<List<TeacherDailyReportView>> getTeacherDailyReports(
    int periodId,
    int teacherId,
    String date,
  );
}
