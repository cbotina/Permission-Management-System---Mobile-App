import 'package:pms_app/features/student_features/permission_requests/domain/models/student_schedule_view.dart';

abstract class IStudentScheduleRepository {
  Future<List<StudentScheduleView>> getStudentSchedule(
    int periodId,
    int studentId,
    String day,
  );
}
