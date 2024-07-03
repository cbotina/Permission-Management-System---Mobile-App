import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/common/models/response_metadata.dart';
import 'package:pms_app/features/student_permissions/data/abstract_repositories/permission_repository.dart';
import 'package:pms_app/features/student_permissions/domain/models/permission.dart';

class MockPermissionsRepository implements IPermissionsRepository {
  @override
  Future<Pagination<Permission>> getStudentPeriodPermissions(
    int periodId,
    int studentId,
    int page,
  ) {
    return Future.value(mockStudentPermissions);
  }
}

Pagination<Permission> mockStudentPermissions = Pagination(
  items: [
    Permission(
      id: 1,
      status: PermissionStatus.approved,
      approvalDate: DateTime(2024, 4, 6),
      requestDate: DateTime(2024, 1, 4),
      reason: 'Disease',
      evidenceUrl: 'photo.jpg',
      studentNote: null,
      principalNote: null,
    ),
    Permission(
      id: 2,
      status: PermissionStatus.rejected,
      approvalDate: null,
      requestDate: DateTime(2024, 1, 4),
      reason: 'Traffic',
      evidenceUrl: 'photo.jpg',
      studentNote: null,
      principalNote: null,
    ),
    Permission(
      id: 2,
      status: PermissionStatus.pending,
      approvalDate: null,
      requestDate: DateTime(2024, 1, 4),
      reason: 'Sleepover',
      evidenceUrl: 'photo.jpg',
      studentNote: null,
      principalNote: null,
    ),
    Permission(
      id: 2,
      status: PermissionStatus.leavePermission,
      approvalDate: null,
      requestDate: DateTime(2024, 1, 4),
      reason: 'Sleepover',
      evidenceUrl: 'photo.jpg',
      studentNote: null,
      principalNote: null,
    ),
  ],
  meta: const ResponseMetadata(
    totalItems: 3,
    itemCount: 3,
    itemsPerPage: 3,
    totalPages: 1,
    currentPage: 1,
  ),
);
