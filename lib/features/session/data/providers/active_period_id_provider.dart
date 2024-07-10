import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';

final activePeriodIdProvider = Provider<int>((ref) {
  return 1;
  return ref.watch(authControllerProvider).when(
        data: (data) => data.periodId ?? 0,
        error: (error, stackTrace) => 0,
        loading: () => 0,
      );
});
