import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_app/features/auth/presentation/state/auth_state.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  return ref.watch(authControllerProvider).when(
        data: (data) => data.authResult == AuthResult.success,
        error: (error, stackTrace) => false,
        loading: () => false,
      );
});
