import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/teacher_features/absences_report/data/providers/subject_absence_count_provider.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/teacher_subjects_view.dart';
import 'package:pms_app/pages/teacher_pages/absence_count_page.dart';

class TeacherSubjectWidget extends ConsumerWidget {
  final TeacherSubjectsView data;
  const TeacherSubjectWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Ink(
        height: 80,
        color: const Color.fromARGB(255, 240, 255, 242),
        child: InkWell(
          onTap: () {
            ref.invalidate(subjectAbsenceCountProvider);
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
