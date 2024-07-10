import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/teacher_features/absences_report/data/dto/subject_group_student_absences_search_options.dart';
import 'package:pms_app/features/teacher_features/absences_report/domain/models/subject_group_student_absence_details_view.dart';

final subjectGroupStudentAbsencesProvider = FutureProvider.family<
    List<SubjectGroupStudentAbsenceDetailsView>,
    SubjectGroupStudentAbsenceSearchOptions>((ref, options) async {
  final subjectGroupId = options.subjectGroupId;
  final studentId = options.studentId;

  return await ref
      .watch(subjectGroupStudentAbsencesRepositoryProvider)
      .getStudentAbsences(subjectGroupId, studentId);
});
