import 'package:pms_app/features/student_profile/data/abstract_repositories/students_repository.dart';
import 'package:pms_app/features/student_profile/domain/models/student.dart';

class MockStudentsRepository implements IStudentsRepository {
  @override
  Future<Student> getStudent(int studentId) {
    return Future.value(mockStudent);
  }
}

const Student mockStudent = Student(
  id: 1,
  cc: '1234',
  firstName: 'John',
  lastName: 'Doe',
  email: 'johndoe@gmail.com',
  gender: Gender.male,
);
