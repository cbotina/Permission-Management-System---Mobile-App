import 'package:pms_app/features/teacher_features/daily_reports/domain/models/teacher_subjects_view.dart';

abstract class ITeacherSubjectsRepository {
  Future<List<TeacherSubjectsView>> getTeacherSubjectGroups(
    int periodId,
    int teacherId,
  );
}
