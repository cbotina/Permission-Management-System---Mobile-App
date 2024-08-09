import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_app/common/components/buttons/secondary_button.dart';
import 'package:pms_app/common/components/form_fields/text_form_field.dart';
import 'package:pms_app/common/components/table/table.dart';
import 'package:pms_app/common/components/table/table_cell.dart';
import 'package:pms_app/common/components/table/table_label.dart';
import 'package:pms_app/common/errors/error_widget.dart';
import 'package:pms_app/features/student_features/student_permissions/data/providers/permission_absences_repository_provider.dart';
import 'package:pms_app/features/student_features/student_permissions/domain/models/permission.dart';
import 'package:pms_app/features/student_features/student_permissions/domain/models/permission_absence_view.dart';
import 'package:pms_app/features/student_features/student_permissions/presentation/widgets/components/permission_status.dart';
import 'package:url_launcher/url_launcher.dart';

class PermissionDetailsPage extends ConsumerWidget {
  final Permission permission;
  const PermissionDetailsPage({
    super.key,
    required this.permission,
  });

  @override
  Widget build(BuildContext context, ref) {
    Future<void> refresh() async {
      ref.invalidate(permissionAbsencesProvider);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles de Permiso"),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            PermissionStatusWidget(
              status: permission.status,
              verbose: true,
            ),
            const SizedBox(height: 7),
            RichText(
              text: TextSpan(
                style:
                    Theme.of(context).textTheme.bodyMedium?.copyWith(height: 2),
                children: [
                  const TextSpan(
                    text: "Fecha de solicitud: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: DateFormat.yMMMMd().format(permission.requestDate),
                  ),
                  const TextSpan(
                    text: "\nFecha de aprobacion: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: permission.approvalDate != null
                        ? DateFormat.yMMMMd().format(permission.approvalDate!)
                        : 'N/A',
                  ),
                  const TextSpan(
                    text: "\nPlazo para justificar: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: permission.justificationDeadline != null
                        ? DateFormat.yMMMMd()
                            .format(permission.justificationDeadline!)
                        : 'N/A',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: PermissionAbsencesTable(permission: permission),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SecondaryButton(
                  onTap: permission.evidenceUrl != null
                      ? () async {
                          final Uri url = Uri.parse(permission.evidenceUrl!);
                          await launchUrl(
                            url,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      : null,
                  child: permission.evidenceUrl != null
                      ? const Text("Ver evidencia")
                      : const Text("Sin evidencia"),
                ),
              ],
            ),
            const SizedBox(height: 15),
            OutlinedTextFormField(
              readOnly: true,
              initialValue: permission.studentNote,
              label: 'Comentario estudiante',
            ),
            const SizedBox(height: 15),
            OutlinedTextFormField(
              readOnly: true,
              initialValue: permission.principalNote,
              label: 'Comentario coordinadora',
            ),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                style:
                    Theme.of(context).textTheme.bodyMedium?.copyWith(height: 2),
                children: const [
                  TextSpan(
                    text: "Nota: ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text:
                        'Es responsabilidad del estudiante contactar a los docentes para acordar las actividades pendientes en las diferentes unidades de formación cursadas en la fecha(s) de ausencia.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PermissionAbsencesTable extends ConsumerWidget {
  final Permission permission;
  const PermissionAbsencesTable({super.key, required this.permission});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final absences = ref.watch(permissionAbsencesProvider(permission.id));
    Future<void> refresh() async {
      ref.invalidate(permissionAbsencesProvider);
    }

    return absences.when(
      skipLoadingOnRefresh: false,
      data: (data) {
        return TableWidget(
          columns: absenceColumns,
          rows: getAbsenceRows(data, context),
        );
      },
      error: (error, stackTrace) => ErrorWidgetUI(onRefresh: refresh),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

List<DataColumn> absenceColumns = [
  const DataColumn(label: TableLabel('Fecha')),
  const DataColumn(label: TableLabel('Horas')),
  const DataColumn(label: TableLabel('Unidad de Formación')),
  const DataColumn(label: TableLabel('Comentario Docente')),
];

List<DataRow> getAbsenceRows(
    List<PermissionAbsenceView> absences, BuildContext context) {
  return absences
      .map(
        (e) => DataRow(
          cells: [
            tableCell(Text(DateFormat.yMd().format(e.absenceDate)),
                MainAxisAlignment.center),
            tableCell(Text(e.startTime.format(context).padLeft(8, '0')),
                MainAxisAlignment.center),
            tableCell(Text(e.subjectName), MainAxisAlignment.center),
            tableCell(Text(e.teacherNote ?? ""), MainAxisAlignment.center),
          ],
        ),
      )
      .toList();
}
