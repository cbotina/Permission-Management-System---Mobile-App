import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/student_unjustified_absences/domain/models/unjustified_absence_details_view.dart';

final justifiableAbsencesProvider =
    FutureProvider<List<UnjustifiedAbsenceDetailsView>>((ref) async {
  const periodId = 1;
  const studentId = 1;

  return await ref
      .watch(unjustifiedAbsencesRepositoryProvider)
      .getJustifiableAbsences(periodId, studentId);
});
