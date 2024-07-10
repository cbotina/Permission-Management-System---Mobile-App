import 'package:pms_app/features/teacher_features/daily_reports/domain/models/subject_group_students_view.dart';

abstract class ISubjectGroupStudentsRepository {
  Future<List<SubjectGroupStudentsView>> getSubjectGroupStudents(
    int subjectGroupId,
  );
}
