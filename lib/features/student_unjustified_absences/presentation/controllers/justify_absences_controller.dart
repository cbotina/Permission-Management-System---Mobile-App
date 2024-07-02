import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/student_unjustified_absences/data/abstract_repositories/unjustified_absences_repository.dart';
import 'package:pms_app/features/student_unjustified_absences/data/dto/justify_absences_request_dto.dart';

class JustifyAbsencesController extends AsyncNotifier<void> {
  late final IUnjustifiedAbsencesRepository _repository =
      ref.watch(unjustifiedAbsencesRepositoryProvider);

  @override
  FutureOr<void> build() {}

  Future<void> justifyAbsences(
      int studentId, JustifyAbsencesRequestDto dto) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => _repository.justifyStudentAbsences(studentId, dto));
  }
}

final justifyAbsencesControllerProvider =
    AsyncNotifierProvider<JustifyAbsencesController, void>(
  () => JustifyAbsencesController(),
);
