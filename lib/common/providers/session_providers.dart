import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/session/domain/models/period.dart';

final entityIdProviderProvider = Provider<int>((ref) {
  return 1;
});

final activePeriodProviderProvider = Provider<Period>((ref) {
  return Period(
    id: 1,
    name: '2024-A',
    startDate: DateTime(2024, 1, 1),
    endDate: DateTime(2024, 12, 30),
  );
});
