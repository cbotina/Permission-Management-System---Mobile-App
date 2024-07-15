import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/providers/justifiable_absences_provider.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/providers/seleted_justified_absences_provider.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/providers/unjustified_absences_provider.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/presentation/widgets/unjustified_absences_table.dart';
import 'package:pms_app/pages/student_pages/justify_absences_page.dart';

class StudentUnjustifiedAbsencesPage extends ConsumerWidget {
  const StudentUnjustifiedAbsencesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Faltas"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(studentUnjustifiedAbsencesProvider);
          ref.invalidate(justifiableAbsencesProvider);
          ref.read(selectedJustifiableAbsencesIdsProvider.notifier).reset();
        },
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Lista de Faltas",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                PrimaryButton(
                  minWidth: 150,
                  child: Text(
                    "Justificar Faltas",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          ref.invalidate(justifiableAbsencesProvider);
                          return const JustifyAbsencesPage();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            const UnjustifiedAbsencesTable(),
          ],
        ),
      ),
    );
  }
}
