import 'package:pms_app/features/teacher_features/daily_reports/data/abstract_repositories/teacher_subjects_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/teacher_subjects_view.dart';

class MockTeacherSubjectsRepository implements ITeacherSubjectsRepository {
  @override
  Future<List<TeacherSubjectsView>> getTeacherSubjectGroups(
      int periodId, int teacherId) async {
    throw mockTeacherSubjects;
  }
}

final List<TeacherSubjectsView> mockTeacherSubjects = [
  const TeacherSubjectsView(
    subjectGroupId: 60,
    subjectName: "Ciencias Sociales",
    groupName: "13-02",
  ),
  const TeacherSubjectsView(
    subjectGroupId: 61,
    subjectName: "Ciencias Sociales",
    groupName: "13-03",
  ),
  const TeacherSubjectsView(
    subjectGroupId: 62,
    subjectName: "Cultura, Educación y Sociedad",
    groupName: "12-03",
  ),
  const TeacherSubjectsView(
    subjectGroupId: 63,
    subjectName: "Formación Ciudadana",
    groupName: "12-03",
  ),
  const TeacherSubjectsView(
    subjectGroupId: 64,
    subjectName: "Práctica Pedagógica Inv - Primaria Rural",
    groupName: "13-01",
  ),
  const TeacherSubjectsView(
    subjectGroupId: 65,
    subjectName: "Seminario Trabajo de Grado",
    groupName: "13-02",
  ),
  const TeacherSubjectsView(
    subjectGroupId: 66,
    subjectName: "Seminario Trabajo de Grado",
    groupName: "13-03",
  ),
  const TeacherSubjectsView(
    subjectGroupId: 67,
    subjectName: "Seminario Trabajo de Grado",
    groupName: "13-04",
  ),
  const TeacherSubjectsView(
    subjectGroupId: 68,
    subjectName: "Socialización III",
    groupName: "13-01",
  ),
];
