import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/auth/application/auth_service.dart';
import 'package:pms_app/features/auth/data/dto/login_dto.dart';
import 'package:pms_app/features/auth/data/providers/valid_token_provider.dart';
import 'package:pms_app/features/auth/presentation/state/auth_state.dart';
import 'package:pms_app/features/student_features/student_profile/data/providers/student_info_provider.dart';

class AuthController extends AsyncNotifier<AuthState> {
  late final AuthService _service = ref.watch(authServiceProvider);

  @override
  FutureOr<AuthState> build() {
    return AuthState(AuthResult.logout, null, null, null, null);
  }

  Future<void> login(LoginDto dto) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _service.login(dto),
    );

    await ref.read(validTokenProvider.notifier).setValue(true);
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _service.logout(),
    );
    await ref.read(validTokenProvider.notifier).setValue(false);
    // ref.invalidate(entityIdProvider);
  }

  void invalidateProviders() {
    ref.invalidate(studentInfoProvider);
  }
}

final authControllerProvider = AsyncNotifierProvider<AuthController, AuthState>(
  () => AuthController(),
);
