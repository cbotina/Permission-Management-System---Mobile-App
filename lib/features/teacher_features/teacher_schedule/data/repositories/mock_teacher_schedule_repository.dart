import 'package:pms_app/common/extensions/string_to_time.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/data/abstract_repositories/teacher_schedule_repository.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/domain/models/teacher_schedule_view.dart';

class MockTeacherScheduleRepository implements ITeacherScheduleRepository {
  @override
  Future<List<TeacherScheduleView>> getTeacherSchedule(
    int periodId,
    int teacherId,
    String day,
  ) async {
    return mockTeacherSchedules;
  }
}

final List<TeacherScheduleView> mockTeacherSchedules = [
  TeacherScheduleView(
    subjectGroupTimeSlotId: 79,
    startTime: "07:00:00".toDayTime(),
    endTime: "07:54:00".toDayTime(),
    subjectGroupId: 62,
    groupName: "12-03",
    subjectName: "Cultura, Educación y Sociedad",
    day: "WED",
  ),
  TeacherScheduleView(
    subjectGroupTimeSlotId: 80,
    startTime: "07:55:00".toDayTime(),
    endTime: "08:49:00".toDayTime(),
    subjectGroupId: 62,
    groupName: "12-03",
    subjectName: "Cultura, Educación y Sociedad",
    day: "WED",
  ),
  TeacherScheduleView(
    subjectGroupTimeSlotId: 181,
    startTime: "08:50:00".toDayTime(),
    endTime: "09:44:00".toDayTime(),
    subjectGroupId: 61,
    groupName: "13-03",
    subjectName: "Ciencias Sociales",
    day: "WED",
  ),
  TeacherScheduleView(
    subjectGroupTimeSlotId: 182,
    startTime: "09:45:00".toDayTime(),
    endTime: "10:39:00".toDayTime(),
    subjectGroupId: 61,
    groupName: "13-03",
    subjectName: "Ciencias Sociales",
    day: "WED",
  ),
];
