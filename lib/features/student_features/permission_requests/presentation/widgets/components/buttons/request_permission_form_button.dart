import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/extensions/async_value_ui.dart';
import 'package:pms_app/features/student_features/permission_requests/data/dto/permission_request_dto.dart';
import 'package:pms_app/features/student_features/permission_requests/data/dto/permission_request_info.dart';
import 'package:pms_app/features/student_features/permission_requests/data/providers/selected_absence_time_slots_provider.dart';
import 'package:pms_app/features/student_features/permission_requests/presentation/controllers/request_permission_controller.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';
import 'package:pms_app/features/student_features/student_permissions/data/providers/student_period_permissions_provider.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/providers/justifiable_absences_provider.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/providers/unjustified_absences_provider.dart';

class RequestPermissionFormButton extends ConsumerWidget {
  const RequestPermissionFormButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.selectedFileInBytes,
    required this.selectedReason,
    required TextEditingController otherReasonController,
    required this.fileExtension,
    required TextEditingController studentNoteController,
  })  : _formKey = formKey,
        _otherReasonController = otherReasonController,
        _studentNoteController = studentNoteController;

  final GlobalKey<FormState> _formKey;
  final Uint8List? selectedFileInBytes;
  final String? selectedReason;
  final TextEditingController _otherReasonController;
  final String? fileExtension;
  final TextEditingController _studentNoteController;

  @override
  Widget build(BuildContext context, ref) {
    final AsyncValue<void> state =
        ref.watch(requestPermissionControllerProvider);

    ref.listen<AsyncValue<void>>(requestPermissionControllerProvider,
        (prev, state) {
      state.dialogOnError(context);
      state.dialogOnSuccess(
        prev,
        'El permiso ha sido creado correctamente',
        context,
      );
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      minWidth: 150,
      minHeight: 30,
      child: const Text(
        "Enviar Solicitud",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          if (selectedFileInBytes == null) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Formato incompleto"),
                  content: const Text("Debe agregar una evidencia al permiso"),
                  actions: [
                    PrimaryButton(
                      // isLoading: state.isLoading,
                      // enabled: !state.isLoading,
                      onTap: Navigator.of(context).pop,
                      child: const Text(
                        "Entendido",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                );
              },
            );

            return;
          }
          if (ref
              .read(selectedAbsenceTimeSlotsProvider)
              .absenceTimeSlots
              .isEmpty) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Formato incompleto"),
                  content: const Text(
                      "Debe agregar al menos una franja horaria al permiso"),
                  actions: [
                    PrimaryButton(
                      // isLoading: state.isLoading,
                      // enabled: !state.isLoading,
                      onTap: Navigator.of(context).pop,
                      child: const Text(
                        "Entendido",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                );
              },
            );
            return;
          }
          final reason = selectedReason == 'Otro'
              ? _otherReasonController.text
              : selectedReason!;

          final selectedTimeSlots =
              ref.watch(selectedAbsenceTimeSlotsProvider).absenceTimeSlots;

          final absenceTimeSlots = selectedTimeSlots
              .map(
                (e) => AbsenceTimeSlot.fromSelectableAbsenceTimeSlot(e),
              )
              .toList();

          final info = PermissionRequestInfo(
            reason: reason,
            fileExtension: fileExtension!,
            fileBytes: selectedFileInBytes!,
            studentNote: _studentNoteController.text,
            absenceTimeSlots: absenceTimeSlots,
          );

          final studentId = ref.watch(entityIdProvider);

          log(studentId.toString());

          await ref
              .read(requestPermissionControllerProvider.notifier)
              .requestPermission(studentId, info);

          ref.invalidate(studentPermissionsProvider);
          ref.invalidate(studentUnjustifiedAbsencesProvider);
          ref.invalidate(justifiableAbsencesProvider);
        }
      },
    );
  }
}
