import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_app/common/components/table/table.dart';
import 'package:pms_app/common/components/table/table_cell.dart';
import 'package:pms_app/common/components/table/table_label.dart';
import 'package:pms_app/features/student_features/student_permissions/presentation/widgets/components/permission_status.dart';
import 'package:pms_app/features/teacher_features/absences_report/data/dto/subject_group_student_absences_search_options.dart';
import 'package:pms_app/features/teacher_features/absences_report/data/providers/subject_group_student_absences_provider.dart';
import 'package:pms_app/features/teacher_features/absences_report/domain/models/subject_group_student_absence_details_view.dart';

class StudentAbsencesReportPage extends ConsumerWidget {
  final int studentId;
  final String studentName;
  final int subjectGroupId;

  const StudentAbsencesReportPage({
    super.key,
    required this.studentId,
    required this.studentName,
    required this.subjectGroupId,
  });

  @override
  Widget build(BuildContext context, ref) {
    final options = SubjectGroupStudentAbsenceSearchOptions(
      studentId: studentId,
      subjectGroupId: subjectGroupId,
    );

    final absences = ref.watch(subjectGroupStudentAbsencesProvider(options));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reporte de faltas"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Text("Estudiante: $studentName"),
          absences.when(
            data: (data) {
              return Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 350,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: TableWidget(
                        columns: subjectAbsencesColumns,
                        rows: permissionAbsencesRows(data, context),
                      ),
                    ),
                  ),
                ],
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

List<DataColumn> subjectAbsencesColumns = [
  const DataColumn(label: TableLabel('Fecha falta')),
  const DataColumn(label: TableLabel('Hora falta')),
  const DataColumn(label: TableLabel('Comentario')),
  const DataColumn(label: TableLabel('Permiso')),
];

List<DataRow> permissionAbsencesRows(
    List<SubjectGroupStudentAbsenceDetailsView> absences,
    BuildContext context) {
  return absences
      .map(
        (e) => DataRow(
          cells: [
            tableCell(Text(DateFormat.yMd().format(e.absenceDate)),
                MainAxisAlignment.center),
            tableCell(
                Text(
                  '${e.startTime.format(context).padLeft(8, '0').substring(0, 5)} -  ${e.endTime.format(context).padLeft(8, '0')}',
                ),
                MainAxisAlignment.center),
            tableCell(Text(e.teacherNote ?? ""), MainAxisAlignment.center),
            tableCell(
                e.permissionStatus == null
                    ? const Text("N/A")
                    : PermissionStatusWidget(status: e.permissionStatus!),
                MainAxisAlignment.center),
          ],
        ),
      )
      .toList();
}
