import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/components/table/pagination_widget.dart';
import 'package:pms_app/common/components/table/table.dart';
import 'package:pms_app/common/components/table/table_cell.dart';
import 'package:pms_app/common/components/table/table_label.dart';
import 'package:pms_app/common/errors/error_widget.dart';
import 'package:pms_app/features/student_features/student_permissions/data/providers/student_leaving_permissions_provider.dart';
import 'package:pms_app/features/student_features/student_permissions/data/providers/student_period_permissions_provider.dart';
import 'package:pms_app/features/student_features/student_permissions/domain/models/permission.dart';
import 'package:pms_app/features/student_features/student_permissions/presentation/widgets/components/buttons/jusitfy_leaving_permission_button.dart';
import 'package:pms_app/features/student_features/student_permissions/presentation/widgets/components/permission_status.dart';
import 'package:pms_app/pages/student_pages/permission_details_page.dart';

class StudentLeavingPermissionsTable extends ConsumerStatefulWidget {
  const StudentLeavingPermissionsTable({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StudentLeavingPermissionsTableState();
}

class _StudentLeavingPermissionsTableState
    extends ConsumerState<StudentLeavingPermissionsTable> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    final permissions = ref.watch(studentLeavingPermissionsProvider(page));

    Future<void> refresh() async {
      ref.invalidate(studentLeavingPermissionsProvider);
    }

    return permissions.when(
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
                  columns: permissionColumns,
                  rows: getPermissionRows(data.items, context),
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
      error: (error, stackTrace) {
        print(error.toString());
        return ErrorWidgetUI(onRefresh: refresh);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      skipLoadingOnRefresh: false,
    );
  }
}

List<DataColumn> permissionColumns = [
  const DataColumn(label: TableLabel('Fecha solicitud')),
  const DataColumn(label: TableLabel('Motivo')),
  const DataColumn(label: TableLabel('Detalles')),
  const DataColumn(label: TableLabel('Justificar')),
];

List<DataRow> getPermissionRows(
    List<Permission> permissions, BuildContext context) {
  return permissions
      .map(
        (e) => DataRow(
          cells: [
            tableCell(Text(DateFormat.yMd().format(e.requestDate)),
                MainAxisAlignment.center),
            tableCell(Text(e.reason), MainAxisAlignment.center),
            tableCell(
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return PermissionDetailsPage(
                              permission: e,
                            );
                          },
                        ),
                      );
                    },
                    child: const Text("Ver detalles")),
                MainAxisAlignment.center),
            tableCell(
              JusitfyLeavingPermissionButton(
                permissionId: e.id,
                enabled: DateTime.now().isBefore(
                  e.justificationDeadline!.add(
                    const Duration(days: 1),
                  ),
                ),
              ),
              MainAxisAlignment.center,
            ),
          ],
        ),
      )
      .toList();
}
