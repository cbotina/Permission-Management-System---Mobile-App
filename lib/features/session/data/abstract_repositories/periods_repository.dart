import 'package:pms_app/features/session/domain/models/period.dart';

abstract class IPeriodsRepository {
  Future<Period?> getActivePeriod();
}
