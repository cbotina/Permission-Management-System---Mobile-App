import 'package:pms_app/features/teacher_features/daily_reports/data/abstract_repositories/daily_reports_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/dto/create_daily_report_dto.dart';

class MockDailyReportsRepository implements IDailyReportsRepository {
  @override
  Future<void> createDailyReport(CreateDailyReportDto dto) async {}
}
