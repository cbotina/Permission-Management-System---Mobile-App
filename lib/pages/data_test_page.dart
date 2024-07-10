import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/extensions/int_to_day_string.dart';
import 'package:pms_app/features/student_features/student_schedule/data/providers/student_schedule_provider.dart';
import 'package:pms_app/features/teacher_features/absences_report/data/dto/subject_group_student_absences_search_options.dart';
import 'package:pms_app/features/teacher_features/absences_report/data/providers/subject_absence_count_provider.dart';
import 'package:pms_app/features/teacher_features/absences_report/data/providers/subject_group_student_absences_provider.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/providers/daily_report_permissions_provider.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/providers/subject_group_students_provider.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/providers/teacher_daily_reports_provider.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/providers/teacher_subjects_provider.dart';
import 'package:pms_app/features/teacher_features/teacher_profile/data/providers/teacher_info_repository.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/data/providers/schedule_with_daily_reports_provider.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/data/providers/teacher_schedule_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final dto = ScheduleRangeDatesDto(
    //     startDate: DateTime(2024, 6, 25), endDate: DateTime(2024, 6, 28));

    final now = DateTime.now();
    final year = now.year;
    final month = now.month;
    final day = now.day;
    final date = DateTime(year, month, day);
    // final dr =
    //     ref.watch(scheduleWithDailyReportsProvider(DateTime(year, month, day)));
    // final student = ref.watch(studentInfoProvider(1));
    const options = SubjectGroupStudentAbsenceSearchOptions(
      studentId: 42,
      subjectGroupId: 62,
    );
    final provider = ref.watch(teacherInfoProvider(8));
    return Scaffold(
      body: Center(
        child: provider.when(
          data: (data) {
            return Text(data.toString());
            // ^ List results
            // return ListView.builder(
            //   itemCount: data.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(data.elementAt(index).toString()),
            //       subtitle: Text(index.toString()),
            //     );
            //   },
            // );
            // return ListView.builder(
            //   itemCount: data.items.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(data.items.elementAt(index).toString()),
            //       subtitle: Text(index.toString()),
            //     );
            //   },
            // );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
