import 'package:pms_app/features/student_features/student_enrollments/data/abstract_repositories/student_enrollments_repository.dart';
import 'package:pms_app/features/student_features/student_enrollments/domain/models/student_enrollment_view.dart';

class MockStudentEnrollmentsRepository
    implements IStudentEnrollmentsRepository {
  List<StudentEnrollmentView> mockData = mockStudentEnrollments;
  bool shouldThrowError = false;

  @override
  Future<List<StudentEnrollmentView>> getStudentEnrollments(
      int periodId, int studentId) {
    if (shouldThrowError) {
      throw Exception('Error al cargar las inscripciones');
    }
    return Future.value(mockData);
  }
}

const List<StudentEnrollmentView> mockStudentEnrollments = [
  StudentEnrollmentView(
    enrollmentId: 1,
    subjectName: 'Matemáticas I',
    teacherName: 'Ana García',
    periodId: 1,
    studentId: 1,
  ),
  StudentEnrollmentView(
    enrollmentId: 2,
    subjectName: 'Física II',
    teacherName: 'Carlos Ruiz',
    periodId: 1,
    studentId: 1,
  ),
  StudentEnrollmentView(
    enrollmentId: 3,
    subjectName: 'Programación Avanzada',
    teacherName: 'Laura Pérez',
    periodId: 1,
    studentId: 1,
  ),
  StudentEnrollmentView(
    enrollmentId: 4,
    subjectName: 'Historia del Arte',
    teacherName: 'Miguel Hernández',
    periodId: 1,
    studentId: 1,
  ),
];
