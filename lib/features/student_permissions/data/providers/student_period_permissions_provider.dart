import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/session/data/providers/active_period_id_provider.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';
import 'package:pms_app/features/student_permissions/domain/models/permission.dart';

final studentPermissionsProvider =
    FutureProvider.family<Pagination<Permission>, int>((ref, page) async {
  final periodId = ref.watch(activePeriodIdProvider);
  final studentId = ref.watch(entityIdProvider);

  return await ref
      .watch(permissionsRepositoryProvider)
      .getStudentPeriodPermissions(periodId, studentId, page);
});
