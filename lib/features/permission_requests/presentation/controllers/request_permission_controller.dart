import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/permission_requests/application/permission_requests_service.dart';
import 'package:pms_app/features/permission_requests/data/dto/permission_request_info.dart';
import 'package:pms_app/features/student_permissions/data/providers/student_period_permissions_provider.dart';

class RequestPermissionController extends AsyncNotifier<void> {
  late final PermissionRequestsService _service =
      ref.watch(permissionRequestServiceProvider);

  @override
  FutureOr<void> build() {}

  Future<void> requestPermission(
      int studentId, PermissionRequestInfo info) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _service.createPermissionRequest(studentId, info),
    );
    ref.invalidate(studentPermissionsProvider);
  }
}

final requestPermissionControllerProvider =
    AsyncNotifierProvider<RequestPermissionController, void>(
  () => RequestPermissionController(),
);
