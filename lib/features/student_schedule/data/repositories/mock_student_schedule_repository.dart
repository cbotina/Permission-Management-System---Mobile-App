import 'package:flutter/material.dart';
import 'package:pms_app/features/permission_requests/domain/models/student_schedule_view.dart';
import 'package:pms_app/features/student_schedule/data/abstract_repositories/student_schedule_repository.dart';

class MockStudentScheduleRepository implements IStudentScheduleRepository {
  @override
  Future<List<StudentScheduleView>> getStudentSchedule(
      int periodId, int studentId, String day) {
    return Future.value(mockStudentSchedule);
  }
}

List<StudentScheduleView> mockStudentSchedule = [
  const StudentScheduleView(
    subjectGroupTimeSlotId: 1,
    startTime: TimeOfDay(hour: 7, minute: 0),
    endTime: TimeOfDay(hour: 7, minute: 50),
    subjectName: "Matematicas",
    day: "MON",
  ),
  const StudentScheduleView(
    subjectGroupTimeSlotId: 1,
    startTime: TimeOfDay(hour: 7, minute: 0),
    endTime: TimeOfDay(hour: 7, minute: 50),
    subjectName: "Matematicas",
    day: "MON",
  ),
  const StudentScheduleView(
    subjectGroupTimeSlotId: 1,
    startTime: TimeOfDay(hour: 7, minute: 0),
    endTime: TimeOfDay(hour: 7, minute: 50),
    subjectName: "Matematicas",
    day: "MON",
  ),
  const StudentScheduleView(
    subjectGroupTimeSlotId: 1,
    startTime: TimeOfDay(hour: 7, minute: 0),
    endTime: TimeOfDay(hour: 7, minute: 50),
    subjectName: "Matematicas",
    day: "MON",
  ),
  const StudentScheduleView(
    subjectGroupTimeSlotId: 1,
    startTime: TimeOfDay(hour: 7, minute: 0),
    endTime: TimeOfDay(hour: 7, minute: 50),
    subjectName: "Matematicas",
    day: "MON",
  ),
  const StudentScheduleView(
    subjectGroupTimeSlotId: 1,
    startTime: TimeOfDay(hour: 7, minute: 0),
    endTime: TimeOfDay(hour: 7, minute: 50),
    subjectName: "Matematicas",
    day: "MON",
  ),
];
