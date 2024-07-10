import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';

final userIdProvider = Provider<int>((ref) {
  return ref.watch(authControllerProvider).when(
        data: (data) => data.userId ?? 0,
        error: (error, stackTrace) => 0,
        loading: () => 0,
      );
});
