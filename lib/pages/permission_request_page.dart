import 'package:flutter/material.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/components/buttons/secondary_button.dart';
import 'package:pms_app/common/components/form_fields/dropdown_button_form_field.dart';
import 'package:pms_app/common/components/form_fields/text_form_field.dart';
import 'package:pms_app/common/components/table/table.dart';
import 'package:pms_app/common/components/table/table_cell.dart';
import 'package:pms_app/common/components/table/table_label.dart';

class PermisssionRequestPage extends StatelessWidget {
  const PermisssionRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Solicitud de Permiso"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .75,
                child: Column(
                  children: [
                    EnumDropdownButtonFormField(
                      values: const ['Cita medica', 'Motivos familiares'],
                      label: "Motivo",
                      onSelected: (p0) {},
                    ),
                    const SizedBox(height: 10),
                    const OutlinedTextFormField(
                      hint: "Especifique el motivo",
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Franjas",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SecondaryButton(
                          minWidth: 150,
                          child: Text(
                            "Seleccionar Franjas",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 350,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: TableWidget(
                          columns: timeSlotsColumns,
                          rows: getTimeSlotsRows(timeSlots),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
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
                  ],
                ),
              ),
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

List<PermissionTimeSlotView> timeSlots = [
  PermissionTimeSlotView(
    subjectGroupTimeSlotId: 1,
    date: DateTime(2024, 1, 4),
    hours: '8:00 - 8:50',
    subject: 'Matematicas',
  ),
  PermissionTimeSlotView(
    subjectGroupTimeSlotId: 2,
    date: DateTime(2024, 1, 4),
    hours: '8:50 - 9:40',
    subject: 'Matematicas',
  ),
  PermissionTimeSlotView(
    subjectGroupTimeSlotId: 3,
    date: DateTime(2024, 1, 4),
    hours: '9:40 - 10:30',
    subject: 'Ingles',
  ),
  PermissionTimeSlotView(
    subjectGroupTimeSlotId: 1,
    date: DateTime(2024, 1, 4),
    hours: '8:00 - 8:50',
    subject: 'Matematicas',
  ),
  PermissionTimeSlotView(
    subjectGroupTimeSlotId: 2,
    date: DateTime(2024, 1, 4),
    hours: '8:50 - 9:40',
    subject: 'Matematicas',
  ),
  PermissionTimeSlotView(
    subjectGroupTimeSlotId: 3,
    date: DateTime(2024, 1, 4),
    hours: '9:40 - 10:30',
    subject: 'Ingles',
  ),
  PermissionTimeSlotView(
    subjectGroupTimeSlotId: 1,
    date: DateTime(2024, 1, 4),
    hours: '8:00 - 8:50',
    subject: 'Matematicas',
  ),
  PermissionTimeSlotView(
    subjectGroupTimeSlotId: 2,
    date: DateTime(2024, 1, 4),
    hours: '8:50 - 9:40',
    subject: 'Matematicas',
  ),
  PermissionTimeSlotView(
    subjectGroupTimeSlotId: 3,
    date: DateTime(2024, 1, 4),
    hours: '9:40 - 10:30',
    subject: 'Ingles',
  ),
  PermissionTimeSlotView(
    subjectGroupTimeSlotId: 1,
    date: DateTime(2024, 1, 4),
    hours: '8:00 - 8:50',
    subject: 'Matematicas',
  ),
  PermissionTimeSlotView(
    subjectGroupTimeSlotId: 2,
    date: DateTime(2024, 1, 4),
    hours: '8:50 - 9:40',
    subject: 'Matematicas',
  ),
  PermissionTimeSlotView(
    subjectGroupTimeSlotId: 3,
    date: DateTime(2024, 1, 4),
    hours: '9:40 - 10:30',
    subject: 'Ingles',
  ),
];

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
