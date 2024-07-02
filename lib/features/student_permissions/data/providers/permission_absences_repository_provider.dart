import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/student_permissions/domain/models/permission_absence_view.dart';

final permissionAbsencesProvider =
    FutureProvider.family<Pagination<PermissionAbsenceView>, int>(
        (ref, page) async {
  const studentId = 1;
  const permissionId = 1;

  return await ref
      .watch(permissionAbsencesRepositoryProvider)
      .getStudentPermissionAbsences(studentId, permissionId, page);
});
