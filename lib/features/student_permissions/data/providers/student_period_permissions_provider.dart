import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/student_permissions/domain/models/permission.dart';

final studentPermissionsProvider =
    FutureProvider.family<Pagination<Permission>, int>((ref, page) async {
  const studentId = 1;
  const periodId = 1;

  return await ref
      .watch(permissionsRepositoryProvider)
      .getStudentPeriodPermissions(periodId, studentId, page);
});
