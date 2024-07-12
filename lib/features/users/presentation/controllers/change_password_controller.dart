import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/users/data/abstract_repositories/users_repository.dart';
import 'package:pms_app/features/users/data/dto/change_password_dto.dart';

class ChangePasswordController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  late final IUsersRepository _usersRepository =
      ref.watch(usersRepositoryProvider);

  Future<void> changePassword(int userId, ChangePasswordDto dto) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => _usersRepository.changePasword(userId, dto));
  }
}

final changePasswordControllerProvider =
    AsyncNotifierProvider<ChangePasswordController, void>(
        () => ChangePasswordController());
