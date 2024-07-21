import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/student_features/permission_requests/application/permission_requests_service.dart';
import 'package:pms_app/features/student_features/permission_requests/data/dto/justify_leaving_permission_info.dart';
import 'package:pms_app/features/student_features/student_permissions/data/providers/student_period_permissions_provider.dart';

class JustifyLeavingPermissionController extends AsyncNotifier<void> {
  late final PermissionRequestsService _service =
      ref.watch(permissionRequestServiceProvider);

  @override
  FutureOr<void> build() {}

  Future<void> justifyLeavingPermission(
    int permissionId,
    JustifyLeavingPermissionInfo info,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _service.justifyLeavingPermission(permissionId, info),
    );
    ref.invalidate(studentPermissionsProvider);
  }
}
