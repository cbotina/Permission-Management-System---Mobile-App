import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/secondary_button.dart';
import 'package:pms_app/common/components/form_fields/dropdown_button_form_field.dart';
import 'package:pms_app/common/components/form_fields/text_form_field.dart';
import 'package:pms_app/common/constants/default_reasons.dart';
import 'package:pms_app/features/student_features/permission_requests/data/dto/schedule_range_dates_dto.dart';
import 'package:pms_app/features/student_features/permission_requests/data/providers/day_time_slots_provider.dart';
import 'package:pms_app/features/student_features/permission_requests/presentation/widgets/components/buttons/request_permission_form_button.dart';
import 'package:pms_app/features/student_features/permission_requests/presentation/widgets/components/buttons/select_time_slots_button.dart';
import 'package:pms_app/features/student_features/permission_requests/presentation/widgets/components/date_range_time_slots.dart';
import 'package:pms_app/features/student_features/permission_requests/presentation/widgets/validators/other_reason_validator.dart';
import 'package:pms_app/features/student_features/permission_requests/presentation/widgets/validators/reason_validator.dart';

class PermisssionRequestPage extends ConsumerStatefulWidget {
  const PermisssionRequestPage({super.key});

  @override
  ConsumerState<PermisssionRequestPage> createState() =>
      _PermisssionRequestPageState();
}

class _PermisssionRequestPageState
    extends ConsumerState<PermisssionRequestPage> {
  late DateTimeRange? selectedRange;
  late ScheduleRangeDatesDto? dto;
  String? selectedReason;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Uint8List? selectedFileInBytes;
  String? fileExtension;
  String? fileName;

  late TextEditingController _otherReasonController;
  late TextEditingController _studentNoteController;

  void setSelectedRange(DateTimeRange newTimeRange) {
    setState(() {
      selectedRange = newTimeRange;
    });
  }

  @override
  void initState() {
    _otherReasonController = TextEditingController();
    _studentNoteController = TextEditingController();
    selectedRange = null;
    dto = null;
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
    if (selectedRange != null) {
      dto = ScheduleRangeDatesDto(
        startDate: selectedRange!.start,
        endDate: selectedRange!.end,
      );
    }

    int? selectedDays = selectedRange?.duration.inDays;

    final daytimeSlots = ref.watch(dayTimeSlotsProvider(dto));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Solicitud de Permiso"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 15),
              EnumDropdownButtonFormField(
                validator: reasonValidator,
                values: defaultReasons,
                label: "Motivo",
                onSelected: (reason) {
                  setState(() {
                    selectedReason = reason;
                  });
                },
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
              Row(
                children: [
                  SelectTimeSlotsButton(
                    setRange: setSelectedRange,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "${selectedRange != null ? selectedDays! + 1 : 0}  ${selectedDays == 0 ? 'día' : 'días'} ${selectedDays == 0 ? 'seleccionado' : 'seleccionados'}",
                      style: const TextStyle(fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              ),
              daytimeSlots.when(
                data: (data) => DateRangeTimeSlotsWidget(dayTimeSlots: data),
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const CircularProgressIndicator(),
              ),
              const SizedBox(height: 15),
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
              RequestPermissionFormButton(
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
      ),
    );
  }
}
