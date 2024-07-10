import 'package:pms_app/features/student_features/student_profile/domain/models/student.dart';

abstract class IStudentsRepository {
  Future<Student> getStudent(int studentId);
}
