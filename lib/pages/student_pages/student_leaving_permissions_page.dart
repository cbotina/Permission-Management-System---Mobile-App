import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/student_features/student_permissions/data/providers/student_leaving_permissions_provider.dart';
import 'package:pms_app/features/student_features/student_permissions/presentation/widgets/student_leaving_permissions_table.dart';
import 'package:pms_app/features/student_features/student_permissions/presentation/widgets/student_permissions_table.dart';

class StudentLeavingPermissionsPage extends ConsumerWidget {
  const StudentLeavingPermissionsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    Future<void> refresh() async {
      ref.invalidate(studentLeavingPermissionsProvider);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Permisos de salida"),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: const [
            SizedBox(height: 15),
            StudentLeavingPermissionsTable(),
          ],
        ),
      ),
    );
  }
}
