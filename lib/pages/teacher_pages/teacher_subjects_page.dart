import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/errors/error_widget.dart';
import 'package:pms_app/features/teacher_features/absences_report/presentation/widgets/components/teacher_subject_widget.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/providers/teacher_subjects_provider.dart';

class TeacherSubjectsPage extends ConsumerWidget {
  const TeacherSubjectsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final teacherSubjects = ref.watch(teacherSubjectsProvider);

    Future<void> refresh() async {
      ref.invalidate(teacherSubjectsProvider);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Reporte de Faltas"),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const Text(
              "Seleccionar Unidad de Formacion:",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            teacherSubjects.when(
              data: (data) {
                return Column(
                  children:
                      data.map((e) => TeacherSubjectWidget(data: e)).toList(),
                );
              },
              error: (error, stackTrace) => ErrorWidgetUI(onRefresh: refresh),
              loading: () => const Center(child: CircularProgressIndicator()),
              skipLoadingOnRefresh: false,
            ),
          ],
        ),
      ),
    );
  }
}
