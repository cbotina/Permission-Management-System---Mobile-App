import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/student_permissions/data/abstract_repositories/permission_absences_repository.dart';
import 'package:pms_app/features/student_permissions/data/abstract_repositories/permission_repository.dart';
import 'package:pms_app/features/student_permissions/data/repositories/impl_permission_absences_repository.dart';
import 'package:pms_app/features/student_permissions/data/repositories/impl_permissions_repository.dart';

final permissionsRepositoryProvider = Provider<IPermissionsRepository>((ref) {
  return ImplPermissionsRepository();
});

final permissionAbsencesRepositoryProvider =
    Provider<IPermissionAbsencesRepository>((ref) {
  return ImplPermissionAbsencesRepository();
});
