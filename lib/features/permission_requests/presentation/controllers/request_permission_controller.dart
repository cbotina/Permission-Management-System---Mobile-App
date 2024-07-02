import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/permission_requests/data/abstract_repositories/permission_request_repository.dart';
import 'package:pms_app/features/permission_requests/data/dto/permission_request_dto.dart';

class RequestPermissionController extends AsyncNotifier<void> {
  late final IPermissionRequestRepository _repository =
      ref.watch(permissionRequestRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> requestPermission(
      int studentId, PermissionRequestDto dto) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _repository.createPermissionRequest(studentId, dto),
    );
  }
}

final requestPermissionControllerProvider =
    AsyncNotifierProvider<RequestPermissionController, void>(
  () => RequestPermissionController(),
);
