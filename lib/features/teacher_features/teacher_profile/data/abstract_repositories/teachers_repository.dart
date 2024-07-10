import 'package:pms_app/features/teacher_features/teacher_profile/domain/models/teacher.dart';

abstract class ITeachersRepository {
  Future<Teacher> getTeacher(int teacherId);
}
