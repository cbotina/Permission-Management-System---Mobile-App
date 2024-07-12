import 'package:pms_app/features/teacher_features/teacher_schedule/domain/models/teacher_schedule_view.dart';

abstract class ITeacherScheduleRepository {
  Future<List<TeacherScheduleView>> getTeacherSchedule(
      int periodId, int teacherId, String day);
}
