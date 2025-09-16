import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/session/data/providers/active_period_id_provider.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';
import 'package:pms_app/features/student_features/student_enrollments/domain/models/student_enrollment_view.dart';

final studentEnrollmentsProvider =
    FutureProvider<List<StudentEnrollmentView>>((ref) async {
  final periodId = ref.watch(activePeriodIdProvider);
  final studentId = ref.watch(entityIdProvider);

  // Only make API call if we have valid IDs
  if (periodId <= 0 || studentId <= 0) {
    return [];
  }

  return await ref
      .watch(studentEnrollmentsRepositoryProvider)
      .getStudentEnrollments(periodId, studentId);
});
