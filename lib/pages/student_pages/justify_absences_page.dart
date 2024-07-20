import 'dart:developer';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/components/buttons/secondary_button.dart';
import 'package:pms_app/common/components/form_fields/dropdown_button_form_field.dart';
import 'package:pms_app/common/components/form_fields/text_form_field.dart';
import 'package:pms_app/common/errors/error_widget.dart';
import 'package:pms_app/common/extensions/async_value_ui.dart';
import 'package:pms_app/features/student_features/permission_requests/presentation/widgets/validators/other_reason_validator.dart';
import 'package:pms_app/features/student_features/permission_requests/presentation/widgets/validators/reason_validator.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/dto/justify_absences_info.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/providers/justifiable_absences_provider.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/providers/seleted_justified_absences_provider.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/providers/unjustified_absences_provider.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/domain/models/unjustified_absence_details_view.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/presentation/controllers/justify_absences_controller.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/presentation/widgets/components/justifiable_absence_check_box.dart';

class JustifyAbsencesPage extends ConsumerStatefulWidget {
  const JustifyAbsencesPage({super.key});

  @override
  ConsumerState<JustifyAbsencesPage> createState() =>
      _JustifyAbsencesPageState();
}

class _JustifyAbsencesPageState extends ConsumerState<JustifyAbsencesPage> {
  String? selectedReason;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Uint8List? selectedFileInBytes;
  String? fileExtension;
  String? fileName;

  late TextEditingController _otherReasonController;
  late TextEditingController _studentNoteController;

  @override
  void initState() {
    _otherReasonController = TextEditingController();
    _studentNoteController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _otherReasonController.dispose();
    _studentNoteController.dispose();
    super.dispose();
  }

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
    final justifiableAbsences = ref.watch(justifiableAbsencesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Justificar Faltas"),
      ),
      body: justifiableAbsences.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text("No tienes faltas justificables..."),
            );
          }

          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  EnumDropdownButtonFormField(
                    values: const ['Cita medica', 'Motivos familiares', 'Otro'],
                    label: "Motivo",
                    onSelected: (reason) {
                      setState(() {
                        selectedReason = reason;
                      });
                    },
                    validator: reasonValidator,
                  ),
                  const SizedBox(height: 10),
                  Visibility(
                    visible: selectedReason == 'Otro',
                    child: OutlinedTextFormField(
                      hint: "Especifique el motivo",
                      controller: _otherReasonController,
                      validator: otherReasonValidator,
                    ),
                  ),
                  const SizedBox(height: 15),
                  JustifiableAbsencesWidget(data: data),
                  const SizedBox(height: 30),
                  OutlinedTextFormField(
                    label: "Nota de estudiante",
                    controller: _studentNoteController,
                  ),
                  const SizedBox(height: 15),
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
                  const SizedBox(height: 30),
                  JustifyAbsencesFormButton(
                    formKey: _formKey,
                    selectedFileInBytes: selectedFileInBytes,
                    selectedReason: selectedReason,
                    otherReasonController: _otherReasonController,
                    fileExtension: fileExtension,
                    studentNoteController: _studentNoteController,
                  ),
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) => ErrorWidgetUI(onRefresh: () {
          ref.invalidate(justifiableAbsencesProvider);
        }),
        loading: () => const Center(child: CircularProgressIndicator()),
        skipLoadingOnRefresh: false,
      ),
    );
  }
}

class JustifyAbsencesFormButton extends ConsumerWidget {
  const JustifyAbsencesFormButton({
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
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(justifyAbsencesControllerProvider);

    ref.listen<AsyncValue<void>>(justifyAbsencesControllerProvider,
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

          final selectedAbsencesIds = ref
              .watch(selectedJustifiableAbsencesIdsProvider)
              .selectedAbsencesIds;

          if (selectedAbsencesIds.isEmpty) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Formato incompleto"),
                  content: const Text("Debe seleccionar al menos una falta"),
                  actions: [
                    PrimaryButton(
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

          final info = JustifyAbsencesInfo(
            reason: reason,
            fileBytes: selectedFileInBytes!,
            fileExtension: fileExtension!,
            studentNote: _studentNoteController.text,
            absencesIds: selectedAbsencesIds,
          );

          final studentId = ref.watch(entityIdProvider);
          log(studentId.toString());

          await ref
              .read(justifyAbsencesControllerProvider.notifier)
              .justifyAbsences(studentId, info);

          ref.invalidate(studentUnjustifiedAbsencesProvider);
          ref.read(selectedJustifiableAbsencesIdsProvider.notifier).reset();
        }
      },
    );
  }
}

class JustifiableAbsencesWidget extends StatelessWidget {
  final List<UnjustifiedAbsenceDetailsView> data;
  const JustifiableAbsencesWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "A continuación, marque las faltas que va a justificar. Recuerde que debe justificar sus faltas en un lapso no mayor a tres días hábiles.",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Color.fromARGB(255, 87, 87, 87),
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: data.map((e) {
            return JustifiableAbsencesCheckBox(absence: e);
          }).toList(),
        ),
      ],
    );
  }
}
