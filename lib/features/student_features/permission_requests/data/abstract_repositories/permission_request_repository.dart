import 'package:pms_app/features/student_features/permission_requests/data/dto/justify_leaving_permission_dto.dart';
import 'package:pms_app/features/student_features/permission_requests/data/dto/permission_request_dto.dart';

abstract class IPermissionRequestRepository {
  Future<void> createPermissionRequest(
    int studentId,
    PermissionRequestDto dto,
  );

  Future<void> justifyLeavingPermission(
    int permissionId,
    JustifyLeavingPermissionDto dto,
  );
}
