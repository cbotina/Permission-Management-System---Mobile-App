import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/components/buttons/secondary_button.dart';
import 'package:pms_app/common/extensions/async_value_ui.dart';
import 'package:pms_app/features/student_features/permission_requests/data/dto/justify_leaving_permission_info.dart';
import 'package:pms_app/features/student_features/permission_requests/presentation/controllers/justify_leaving_permission_controller.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/dto/justify_absences_info.dart';

class JustifyLeavingPermissionForm extends ConsumerStatefulWidget {
  final int permissionId;
  const JustifyLeavingPermissionForm({
    super.key,
    required this.permissionId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _JustifyLeavingPermissionFormState();
}

class _JustifyLeavingPermissionFormState
    extends ConsumerState<JustifyLeavingPermissionForm> {
  Uint8List? selectedFileInBytes;
  String? fileExtension;
  String? fileName;

  Future _selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
      withData: true,
    );

    if (result == null) return;

    if (result.files.first.size > 100000000) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Archivo muy pesado"),
            );
          },
        );
      }
    }

    setState(() {
      selectedFileInBytes = result.files.first.bytes;
      fileExtension = result.files.first.extension;
      fileName = result.files.first.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Justificar Permiso de salida",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              SecondaryButton(
                onTap: _selectFile,
                child: Row(
                  children: [
                    Icon(
                      Icons.upload,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Text(
                      "Subir evidencia",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  selectedFileInBytes == null
                      ? "Ningun archivo seleccionado"
                      : fileName!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          JustifyLeavingPermissionFormButton(
            selectedFileInBytes: selectedFileInBytes,
            fileExtension: fileExtension,
            permissionId: widget.permissionId,
          ),
        ],
      ),
    );
  }
}

class JustifyLeavingPermissionFormButton extends ConsumerWidget {
  const JustifyLeavingPermissionFormButton({
    super.key,
    required this.selectedFileInBytes,
    required this.fileExtension,
    required this.permissionId,
  });

  final Uint8List? selectedFileInBytes;
  final String? fileExtension;

  final int permissionId;

  @override
  Widget build(BuildContext context, ref) {
    final AsyncValue<void> state =
        ref.watch(justifyLeavingPermissionControllerProvider);

    ref.listen<AsyncValue<void>>(justifyLeavingPermissionControllerProvider,
        (prev, state) {
      state.dialogOnError(context);
      state.dialogOnSuccess(
        prev,
        'Permiso de salida justificado correctamente.',
        context,
      );
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      child: const Text("Aceptar"),
      onTap: () {
        final info = JustifyLeavingPermissionInfo(
          fileBytes: selectedFileInBytes!,
          fileExtension: fileExtension!,
        );

        ref
            .read(justifyLeavingPermissionControllerProvider.notifier)
            .justifyLeavingPermission(permissionId, info);
      },
    );
  }
}
