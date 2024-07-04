import 'package:pms_app/features/permission_requests/data/abstract_repositories/permission_request_repository.dart';
import 'package:pms_app/features/permission_requests/data/dto/permission_request_dto.dart';

class MockPermissionRequestRepository implements IPermissionRequestRepository {
  @override
  Future<void> createPermissionRequest(
      int studentId, PermissionRequestDto dto) async {}
}
