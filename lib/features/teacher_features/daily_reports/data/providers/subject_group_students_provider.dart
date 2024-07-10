import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/subject_group_students_view.dart';

final subjectGroupStudentsProvider =
    FutureProvider.family<List<SubjectGroupStudentsView>, int>(
        (ref, subjectGroupId) async {
  return await ref
      .watch(subjectGroupStudentsRepositoryProvider)
      .getSubjectGroupStudents(subjectGroupId);
});
