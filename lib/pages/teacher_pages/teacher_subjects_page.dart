import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/providers/teacher_subjects_provider.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/teacher_subjects_view.dart';
import 'package:pms_app/pages/teacher_pages/absence_count_page.dart';

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

class TeacherSubjectWidget extends StatelessWidget {
  final TeacherSubjectsView data;
  const TeacherSubjectWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Ink(
        height: 80,
        color: const Color.fromARGB(255, 240, 255, 242),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return AbsenceCountPage(
                  subjectGroupId: data.subjectGroupId,
                );
              },
            ));
          },
          child: Row(
            children: [
              Container(
                color: Theme.of(context).colorScheme.primary,
                width: 6,
                height: 80,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.subjectName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        data.groupName,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.grey.shade700,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
