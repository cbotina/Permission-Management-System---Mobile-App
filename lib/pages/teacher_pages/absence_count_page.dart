import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/common/errors/error_widget.dart';
import 'package:pms_app/features/student_features/student_profile/domain/models/student.dart';
import 'package:pms_app/features/teacher_features/absences_report/data/providers/subject_absence_count_provider.dart';
import 'package:pms_app/features/teacher_features/absences_report/domain/models/absence_count_view.dart';
import 'package:pms_app/pages/teacher_pages/student_absences_report_page.dart';

class AbsenceCountPage extends ConsumerWidget {
  final int subjectGroupId;

  const AbsenceCountPage({super.key, required this.subjectGroupId});

  @override
  Widget build(BuildContext context, ref) {
    final absenceCount = ref.watch(subjectAbsenceCountProvider(subjectGroupId));

    Future<void> refresh() async {
      ref.invalidate(subjectAbsenceCountProvider);
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
            absenceCount.when(
              skipLoadingOnRefresh: false,
              data: (data) {
                return Column(
                  children: data.map((e) {
                    return AbsenceCountWidget(data: e);
                  }).toList(),
                );
              },
              error: (error, stackTrace) => ErrorWidgetUI(onRefresh: refresh),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}

class AbsenceCountWidget extends StatelessWidget {
  final AbsenceCountView data;
  const AbsenceCountWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: data.studentGender == Gender.male
          ? Icons.person_2_sharp
          : Icons.person_3,
      title: data.student,
      subtitle: '${data.absences}  faltas en el semestre',
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return StudentAbsencesReportPage(
              studentId: data.studentId,
              studentName: data.student,
              subjectGroupId: data.subjectGroupId,
            );
          },
        ));
      },
    );
  }
}
