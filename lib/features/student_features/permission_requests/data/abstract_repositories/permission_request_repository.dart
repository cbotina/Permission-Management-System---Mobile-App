import 'package:pms_app/features/student_features/permission_requests/data/dto/permission_request_dto.dart';

abstract class IPermissionRequestRepository {
  Future<void> createPermissionRequest(
    int studentId,
    PermissionRequestDto dto,
  );
}
