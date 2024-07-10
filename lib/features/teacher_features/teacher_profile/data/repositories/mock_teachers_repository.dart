import 'package:pms_app/features/teacher_features/teacher_profile/data/abstract_repositories/teachers_repository.dart';
import 'package:pms_app/features/teacher_features/teacher_profile/domain/models/teacher.dart';

class MockTeachersRepository implements ITeachersRepository {
  @override
  Future<Teacher> getTeacher(int teacherId) async {
    return teacher;
  }
}

Teacher teacher = const Teacher(
  id: 8,
  cc: "1008",
  email: "hernandoeliecer@gmail.com",
  firstName: "Hernando Eliécer",
  lastName: "Calvache J.",
);
