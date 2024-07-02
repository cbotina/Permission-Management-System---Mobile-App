import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/student_permissions/data/providers/permission_absences_repository_provider.dart';
import 'package:pms_app/features/student_permissions/data/providers/student_period_permissions_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final permissions = ref.watch(permissionAbsencesProvider(1));

    return Scaffold(
      body: Center(
        child: permissions.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data.items.elementAt(index).toString()),
                  subtitle: Text(index.toString()),
                );
              },
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
