import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/session/data/providers/active_period_id_provider.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/domain/models/unjustified_absence_details_view.dart';

final studentUnjustifiedAbsencesProvider =
    FutureProvider.family<Pagination<UnjustifiedAbsenceDetailsView>, int>(
        (ref, page) async {
  final periodId = ref.watch(activePeriodIdProvider);
  final studentId = ref.watch(entityIdProvider);

  return await ref
      .watch(unjustifiedAbsencesRepositoryProvider)
      .getStudentUnjustifiedAbsences(periodId, studentId, page);
});
