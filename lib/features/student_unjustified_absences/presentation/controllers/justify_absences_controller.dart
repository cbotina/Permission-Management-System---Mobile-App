import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/student_permissions/data/providers/student_period_permissions_provider.dart';
import 'package:pms_app/features/student_unjustified_absences/application/justify_absences_service.dart';
import 'package:pms_app/features/student_unjustified_absences/data/dto/justify_absences_info.dart';
import 'package:pms_app/features/student_unjustified_absences/data/providers/justifiable_absences_provider.dart';
import 'package:pms_app/features/student_unjustified_absences/data/providers/unjustified_absences_provider.dart';

class JustifyAbsencesController extends AsyncNotifier<void> {
  late final JustifyAbsencesService _service =
      ref.watch(justifyAbsencesServiceProvider);

  @override
  FutureOr<void> build() {}

  Future<void> justifyAbsences(int studentId, JustifyAbsencesInfo info) async {
    state = const AsyncValue.loading();
    state =
        await AsyncValue.guard(() => _service.justifyAbsences(studentId, info));
    ref.invalidate(studentPermissionsProvider);
    ref.invalidate(studentUnjustifiedAbsencesProvider);
    ref.invalidate(justifiableAbsencesProvider);
  }
}

final justifyAbsencesControllerProvider =
    AsyncNotifierProvider<JustifyAbsencesController, void>(
  () => JustifyAbsencesController(),
);
