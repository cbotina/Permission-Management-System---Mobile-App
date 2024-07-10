import 'package:pms_app/common/extensions/string_to_time.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/abstract_repositories/teacher_daily_reports_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/teacher_daily_report_view.dart';

class MockTeacherDailyRerportsRepository
    implements ITeacherDailyReportsRepository {
  @override
  Future<List<TeacherDailyReportView>> getTeacherDailyReports(
    int periodId,
    int teacherId,
    String date,
  ) async {
    return mockDailyReports;
  }
}

final List<TeacherDailyReportView> mockDailyReports = [
  TeacherDailyReportView(
    dailyReportId: 24,
    subjectGroupTimeSlotId: 79,
    subjectGroupId: 62,
    reportDate: DateTime.parse("2024-07-10T05:00:00.000Z"),
    startTime: "07:00:00".toDayTime(),
    endTime: "07:54:00".toDayTime(),
    subjectName: "Cultura, Educación y Sociedad",
    groupName: "12-03",
    isSubmitted: false,
  ),
  TeacherDailyReportView(
    dailyReportId: 23,
    subjectGroupTimeSlotId: 80,
    subjectGroupId: 62,
    reportDate: DateTime.parse("2024-07-10T05:00:00.000Z"),
    startTime: "07:55:00".toDayTime(),
    endTime: "08:49:00".toDayTime(),
    subjectName: "Cultura, Educación y Sociedad",
    groupName: "12-03",
    isSubmitted: false,
  ),
];
