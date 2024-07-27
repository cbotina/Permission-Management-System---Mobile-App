import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_app/features/session/domain/models/period.dart';

final activePeriodProvider = Provider<Period?>((ref) {
  return ref.watch(authControllerProvider).when(
        data: (data) => data.activePeriod,
        error: (error, stackTrace) => null,
        loading: () => null,
      );
});
