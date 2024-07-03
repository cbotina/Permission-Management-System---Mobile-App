import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/components/buttons/secondary_button.dart';
import 'package:pms_app/common/components/form_fields/dropdown_button_form_field.dart';
import 'package:pms_app/common/components/form_fields/text_form_field.dart';
import 'package:pms_app/common/components/table/table.dart';
import 'package:pms_app/common/components/table/table_cell.dart';
import 'package:pms_app/common/components/table/table_label.dart';
import 'package:pms_app/common/providers/session_providers.dart';
import 'package:pms_app/features/permission_requests/data/dto/permission_request_dto.dart';
import 'package:pms_app/features/permission_requests/data/dto/schedule_range_dates_dto.dart';
import 'package:pms_app/features/permission_requests/data/providers/day_time_slots_provider.dart';
import 'package:pms_app/features/permission_requests/data/providers/selected_absence_time_slots_provider.dart';
import 'package:pms_app/features/permission_requests/domain/models/selectable_absence_time_slot.dart';
import 'package:pms_app/features/permission_requests/domain/models/student_schedule_view.dart';
import 'package:pms_app/features/permission_requests/presentation/widgets/components/buttons/select_time_slots_button.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
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
            // const SizedBox(height: 30),
            daytimeSlots.when(
              data: (dayTimeSlotsData) {
                if (dayTimeSlotsData.isEmpty) {
                  return const SizedBox();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "A continuación, marque las franjas horarias en las que se ausentará",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 87, 87, 87),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: dayTimeSlotsData.map((e) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat.yMMMMEEEEd()
                                  .format(e.date)
                                  .toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(height: 10),
                                ...e.subjectGroupTimeSlots.map((i) {
                                  return SubjectGroupTimeSlotCheckBox(
                                    date: e.date,
                                    subjectGroupTimeSlot: i,
                                  );
                                }),
                              ],
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                );
              },
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
      ),
    );
  }
}

class RangeTimeSlotsWidget extends ConsumerWidget {
  const RangeTimeSlotsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

class SubjectGroupTimeSlotCheckBox extends StatefulWidget {
  final StudentScheduleView subjectGroupTimeSlot;
  final DateTime date;
  const SubjectGroupTimeSlotCheckBox({
    super.key,
    required this.subjectGroupTimeSlot,
    required this.date,
  });

  @override
  State<SubjectGroupTimeSlotCheckBox> createState() =>
      _SubjectGroupTimeSlotCheckBoxState();
}

class _SubjectGroupTimeSlotCheckBoxState
    extends State<SubjectGroupTimeSlotCheckBox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 213, 232, 240),
                borderRadius: BorderRadius.circular(5),
              ),
              width: 130,
              child: Text(
                '${widget.subjectGroupTimeSlot.startTime.format(context).padLeft(8, '0').substring(0, 5)} -  ${widget.subjectGroupTimeSlot.endTime.format(context).padLeft(8, '0')}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.subjectGroupTimeSlot.subjectName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Consumer(builder: (context, ref, child) {
              return Checkbox(
                value: isSelected,
                activeColor: Theme.of(context).colorScheme.primary,
                onChanged: (value) {
                  setState(() {
                    isSelected = value ?? false;
                  });
                  final absenceTimeSlot = SelectableAbsenceTimeSlot(
                    date: widget.date,
                    subjectGroupTimeSlotId:
                        widget.subjectGroupTimeSlot.subjectGroupTimeSlotId,
                  );

                  if (value == false) {
                    ref
                        .read(selectedAbsenceTimeSlotsProvider.notifier)
                        .remove(absenceTimeSlot);
                  } else {
                    ref
                        .read(selectedAbsenceTimeSlotsProvider.notifier)
                        .add(absenceTimeSlot);
                  }

                  final result = ref
                      .watch(selectedAbsenceTimeSlotsProvider)
                      .absenceTimeSlots;

                  print(result.toString());
                },
              );
            })
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

List<DataColumn> timeSlotsColumns = [
  const DataColumn(label: TableLabel('Fecha')),
  const DataColumn(label: TableLabel('Horas')),
  const DataColumn(label: TableLabel('Materia')),
];

class PermissionTimeSlotView {
  final DateTime date;
  final String hours;
  final String subject;
  final int subjectGroupTimeSlotId;

  PermissionTimeSlotView({
    required this.date,
    required this.hours,
    required this.subject,
    required this.subjectGroupTimeSlotId,
  });
}

List<DataRow> getTimeSlotsRows(List<PermissionTimeSlotView> timeSlots) {
  return timeSlots
      .map(
        (e) => DataRow(
          cells: [
            tableCell(Text(e.date.toString().substring(0, 10)),
                MainAxisAlignment.center),
            tableCell(Text(e.hours), MainAxisAlignment.center),
            tableCell(Text(e.subject), MainAxisAlignment.center)
          ],
        ),
      )
      .toList();
}
