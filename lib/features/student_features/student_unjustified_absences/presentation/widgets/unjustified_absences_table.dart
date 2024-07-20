import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_app/common/components/table/pagination_widget.dart';
import 'package:pms_app/common/components/table/table.dart';
import 'package:pms_app/common/components/table/table_cell.dart';
import 'package:pms_app/common/components/table/table_label.dart';
import 'package:pms_app/common/errors/error_widget.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/providers/justifiable_absences_provider.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/providers/seleted_justified_absences_provider.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/providers/unjustified_absences_provider.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/domain/models/unjustified_absence_details_view.dart';

class UnjustifiedAbsencesTable extends ConsumerStatefulWidget {
  const UnjustifiedAbsencesTable({
    super.key,
  });

  @override
  ConsumerState<UnjustifiedAbsencesTable> createState() =>
      _UnjustifiedAbsencesTableState();
}

class _UnjustifiedAbsencesTableState
    extends ConsumerState<UnjustifiedAbsencesTable> {
  int page = 1;
  @override
  Widget build(BuildContext context) {
    final absences = ref.watch(studentUnjustifiedAbsencesProvider(page));

    Future<void> refresh() async {
      ref.invalidate(studentUnjustifiedAbsencesProvider);
      ref.invalidate(justifiableAbsencesProvider);
      ref.read(selectedJustifiableAbsencesIdsProvider.notifier).reset();
    }

    return absences.when(
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
                  columns: timeSlotsColumns,
                  rows: getAbsencesRows(data.items, context),
                ),
              ),
            ),
            PaginationWidget(
                totalPages: data.meta.totalPages,
                currentPage: data.meta.currentPage,
                onForward: () {
                  setState(() {
                    page = page + 1;
                  });
                },
                onBack: () {
                  setState(() {
                    page = page - 1;
                  });
                })
          ],
        );
      },
      error: (error, stackTrace) => ErrorWidgetUI(onRefresh: refresh),
      loading: () => const Center(child: CircularProgressIndicator()),
      skipLoadingOnRefresh: false,
    );
  }
}

List<DataColumn> timeSlotsColumns = [
  const DataColumn(label: TableLabel('Fecha')),
  const DataColumn(label: TableLabel('Horas')),
  const DataColumn(label: TableLabel('Unidad de Formación')),
  const DataColumn(label: TableLabel('Comentario Docente')),
];

List<DataRow> getAbsencesRows(
    List<UnjustifiedAbsenceDetailsView> absence, BuildContext context) {
  return absence
      .map(
        (e) => DataRow(
          cells: [
            tableCell(Text(DateFormat.yMd().format(e.absenceDate)),
                MainAxisAlignment.center),
            tableCell(
                Text(
                  '${e.startTime.format(context)} - ${e.endTime.format(context)}',
                ),
                MainAxisAlignment.center),
            tableCell(Text(e.subjectName), MainAxisAlignment.center),
            tableCell(Text(e.teacherNote ?? ""), MainAxisAlignment.center),
          ],
        ),
      )
      .toList();
}
