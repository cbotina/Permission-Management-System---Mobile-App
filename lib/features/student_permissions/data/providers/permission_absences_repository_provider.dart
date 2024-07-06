import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';
import 'package:pms_app/features/student_permissions/domain/models/permission_absence_view.dart';

final permissionAbsencesProvider =
    FutureProvider.family<List<PermissionAbsenceView>, int>(
  (ref, permissionId) async {
    final studentId = ref.watch(entityIdProvider);

    return await ref
        .watch(permissionAbsencesRepositoryProvider)
        .getStudentPermissionAbsences(studentId, permissionId, 1)
        .then(
          (value) => value.items,
        );
  },
);
