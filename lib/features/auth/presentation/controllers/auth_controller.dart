import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/auth/application/auth_service.dart';
import 'package:pms_app/features/auth/data/dto/login_dto.dart';
import 'package:pms_app/features/auth/presentation/state/auth_state.dart';

class AuthController extends AsyncNotifier<AuthState> {
  late final AuthService _service = ref.watch(authServiceProvider);

  @override
  FutureOr<AuthState> build() {
    // return AuthState(AuthResult.success, 1, 78, 1, UserRole.student);
    return AuthState(AuthResult.logout, null, null, null, null);
  }

  Future<void> login(LoginDto dto) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _service.login(dto),
    );
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _service.logout(),
    );
  }
}

final authControllerProvider = AsyncNotifierProvider<AuthController, AuthState>(
  () => AuthController(),
);
