import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/components/buttons/secondary_button.dart';
import 'package:pms_app/common/components/form_fields/dropdown_button_form_field.dart';
import 'package:pms_app/common/components/form_fields/text_form_field.dart';
import 'package:pms_app/features/permission_requests/data/dto/schedule_range_dates_dto.dart';
import 'package:pms_app/features/permission_requests/data/providers/day_time_slots_provider.dart';
import 'package:pms_app/features/permission_requests/presentation/widgets/components/buttons/select_time_slots_button.dart';
import 'package:pms_app/features/permission_requests/presentation/widgets/components/date_range_time_slots.dart';

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

  void setSelectedRange(DateTimeRange newTimeRange) {
    setState(() {
      selectedRange = newTimeRange;
    });
  }

  @override
  void initState() {
    selectedRange = null;
    dto = null;
    super.initState();
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
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const SizedBox(height: 15),
          EnumDropdownButtonFormField(
            values: const ['Cita medica', 'Motivos familiares', 'Otro'],
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
            child: const OutlinedTextFormField(
              hint: "Especifique el motivo",
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
          const OutlinedTextFormField(
            label: "Nota de estudiante",
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              SecondaryButton(
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
                onTap: () {},
              ),
              const SizedBox(width: 15),
              Text(
                "file.jpg",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 30),
          PrimaryButton(
            minWidth: 150,
            minHeight: 30,
            child: const Text(
              "Enviar Solicitud",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
