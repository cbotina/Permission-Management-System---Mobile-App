import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/teacher_features/absences_report/presentation/widgets/components/teacher_subject_widget.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/providers/teacher_subjects_provider.dart';

class TeacherSubjectsPage extends StatelessWidget {
  const TeacherSubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reporte de Faltas"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const Text("Seleccionar Unidad de Formacion"),
          Consumer(
            builder: (context, ref, child) {
              final teacherSubjects = ref.watch(teacherSubjectsProvider);

              return teacherSubjects.when(
                data: (data) {
                  return Column(
                    children:
                        data.map((e) => TeacherSubjectWidget(data: e)).toList(),
                  );
                },
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
