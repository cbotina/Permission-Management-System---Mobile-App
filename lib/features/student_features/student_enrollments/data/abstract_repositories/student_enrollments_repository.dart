import 'package:pms_app/features/student_features/student_enrollments/domain/models/student_enrollment_view.dart';

abstract class IStudentEnrollmentsRepository {
  Future<List<StudentEnrollmentView>> getStudentEnrollments(
      int periodId, int studentId);
}
