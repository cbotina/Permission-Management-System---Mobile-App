import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/student_features/student_permissions/data/providers/student_period_permissions_provider.dart';
import 'package:pms_app/features/student_features/student_permissions/presentation/widgets/student_permissions_table.dart';

class StudentPermissionsPage extends ConsumerWidget {
  const StudentPermissionsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Permisos"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(studentPermissionsProvider);
        },
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: const [
            SizedBox(height: 15),
            StudentPermissionsTable(),
          ],
        ),
      ),
    );
  }
}
