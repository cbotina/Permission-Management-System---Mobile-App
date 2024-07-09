import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/extensions/async_value_ui.dart';
import 'package:pms_app/features/student_unjustified_absences/presentation/controllers/justify_absences_controller.dart';

class ActionTestPage extends ConsumerWidget {
  const ActionTestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(justifyAbsencesControllerProvider);

    ref.listen<AsyncValue<void>>(justifyAbsencesControllerProvider,
        (prev, state) {
      state.dialogOnError(context);
      // state.popOnSuccess(
      //   prev,
      //   "Operacion exitosa",
      //   context,
      // );
    });
    return Scaffold(
      body: PrimaryButton(
        isLoading: state.isLoading,
        enabled: !state.isLoading,
        onTap: () async {
          // final dto = JustifyAbsencesInfo(
          //   reason: "Justificacion valida",
          //   evidenceUrl: "hola.jpg",
          //   studentNote: "hey",
          //   unjustifiedAbsencesIds: [4, 6],
          // );

          // await ref
          //     .read(justifyAbsencesControllerProvider.notifier)
          //     .justifyAbsences(1, dto);
        },
        minWidth: 80,
        child: const Text(
          "Crear",
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
