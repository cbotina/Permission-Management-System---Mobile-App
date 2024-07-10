import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/teacher_features/absences_report/domain/models/absence_count_view.dart';

final subjectAbsenceCountProvider =
    FutureProvider.family<List<AbsenceCountView>, int>(
        (ref, subjectGroupId) async {
  return await ref
      .watch(absenceCountRepositoryProvider)
      .getSubjectAbsenceCount(subjectGroupId);
});
