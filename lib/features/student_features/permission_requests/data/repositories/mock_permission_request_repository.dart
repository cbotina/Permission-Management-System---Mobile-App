import 'package:pms_app/features/student_features/permission_requests/data/abstract_repositories/permission_request_repository.dart';
import 'package:pms_app/features/student_features/permission_requests/data/dto/justify_leaving_permission_dto.dart';
import 'package:pms_app/features/student_features/permission_requests/data/dto/permission_request_dto.dart';

class MockPermissionRequestRepository implements IPermissionRequestRepository {
  @override
  Future<void> createPermissionRequest(
      int studentId, PermissionRequestDto dto) async {}

  @override
  Future<void> justifyLeavingPermission(
    int permissionId,
    JustifyLeavingPermissionDto dto,
  ) {
    // TODO: implement justifyLeavingPermission
    throw UnimplementedError();
  }
}
