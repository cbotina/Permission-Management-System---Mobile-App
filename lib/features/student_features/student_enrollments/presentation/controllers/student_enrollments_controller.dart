import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/student_features/student_enrollments/data/abstract_repositories/student_enrollments_repository.dart';
import 'package:pms_app/features/student_features/student_enrollments/domain/models/student_enrollment_view.dart';

class StudentEnrollmentsController
    extends AsyncNotifier<List<StudentEnrollmentView>> {
  late final IStudentEnrollmentsRepository _repository =
      ref.watch(studentEnrollmentsRepositoryProvider);

  @override
  FutureOr<List<StudentEnrollmentView>> build() {
    return [];
  }

  Future<void> loadEnrollments(int periodId, int studentId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => _repository.getStudentEnrollments(periodId, studentId),
    );
  }
}

final studentEnrollmentsControllerProvider = AsyncNotifierProvider<
    StudentEnrollmentsController, List<StudentEnrollmentView>>(
  () => StudentEnrollmentsController(),
);
