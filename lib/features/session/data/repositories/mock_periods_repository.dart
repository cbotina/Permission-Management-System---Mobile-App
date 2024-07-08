import 'package:pms_app/features/session/data/abstract_repositories/periods_repository.dart';
import 'package:pms_app/features/session/domain/models/period.dart';

class MockPeriodsRepository implements IPeriodsRepository {
  @override
  Future<Period?> getActivePeriod() async {
    return Period(
      id: 1,
      name: '2024-A',
      startDate: DateTime(2024, 1, 1),
      endDate: DateTime(2024, 6, 1),
    );
  }
}
