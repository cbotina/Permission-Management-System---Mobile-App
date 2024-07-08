import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/student_unjustified_absences/application/justify_absences_service.dart';
import 'package:pms_app/features/student_unjustified_absences/data/dto/justify_absences_info.dart';

class JustifyAbsencesController extends AsyncNotifier<void> {
  late final JustifyAbsencesService _service =
      ref.watch(justifyAbsencesServiceProvider);

  @override
  FutureOr<void> build() {}

  Future<void> justifyAbsences(JustifyAbsencesInfo info) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _service.justifyAbsences(info));
  }
}

final justifyAbsencesControllerProvider =
    AsyncNotifierProvider<JustifyAbsencesController, void>(
  () => JustifyAbsencesController(),
);
