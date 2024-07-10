import 'package:pms_app/features/teacher_features/daily_reports/data/dto/create_daily_report_dto.dart';

abstract class IDailyReportsRepository {
  Future<void> createDailyReport(CreateDailyReportDto dto);
}
