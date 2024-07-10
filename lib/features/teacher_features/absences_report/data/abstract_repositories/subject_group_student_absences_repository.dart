import 'package:pms_app/features/teacher_features/absences_report/domain/models/subject_group_student_absence_details_view.dart';

abstract class ISubjectGroupStudentAbsencesRepository {
  Future<List<SubjectGroupStudentAbsenceDetailsView>> getStudentAbsences(
    int subjectGroupId,
    int studentId,
  );
}
