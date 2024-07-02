import 'package:flutter/material.dart';
import 'package:pms_app/features/permission_requests/data/abstract_repositories/day_time_slots_repository.dart';
import 'package:pms_app/features/permission_requests/domain/models/day_time_slots.dart';
import 'package:pms_app/features/permission_requests/domain/models/student_schedule_view.dart';

class MockDayTimeSlotsRepository implements IDayTimeSlotsRepository {
  @override
  Future<List<DayTimeSlots>> getAll(DateTime startDate, DateTime endDate) {
    return Future.value(mockDayTimeSlots);
  }
}

List<DayTimeSlots> mockDayTimeSlots = [
  const DayTimeSlots(
    date: '2024-06-24',
    subjectGroupTimeSlots: [
      StudentScheduleView(
        subjectGroupTimeSlotId: 1,
        startTime: TimeOfDay(hour: 7, minute: 0),
        endTime: TimeOfDay(hour: 7, minute: 54),
        subjectName: 'Etica y Valores',
        day: 'MON',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 2,
        startTime: TimeOfDay(hour: 7, minute: 55),
        endTime: TimeOfDay(hour: 8, minute: 49),
        subjectName: 'Etica y Valores',
        day: 'MON',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 3,
        startTime: TimeOfDay(hour: 8, minute: 50),
        endTime: TimeOfDay(hour: 9, minute: 44),
        subjectName: 'Dinamización de Semestre',
        day: 'MON',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 4,
        startTime: TimeOfDay(hour: 9, minute: 45),
        endTime: TimeOfDay(hour: 10, minute: 39),
        subjectName: 'Educación Matemática I',
        day: 'MON',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 6,
        startTime: TimeOfDay(hour: 11, minute: 10),
        endTime: TimeOfDay(hour: 12, minute: 4),
        subjectName: 'Psicología del Desarrollo I',
        day: 'MON',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 5,
        startTime: TimeOfDay(hour: 12, minute: 5),
        endTime: TimeOfDay(hour: 12, minute: 54),
        subjectName: 'Psicología del Desarrollo I',
        day: 'MON',
      ),
    ],
  ),
  const DayTimeSlots(
    date: '2024-06-25',
    subjectGroupTimeSlots: [
      StudentScheduleView(
        subjectGroupTimeSlotId: 7,
        startTime: TimeOfDay(hour: 7, minute: 0),
        endTime: TimeOfDay(hour: 7, minute: 54),
        subjectName: 'Práctica Pedagógica Inv - Observación Pedagógica',
        day: 'TUE',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 8,
        startTime: TimeOfDay(hour: 7, minute: 55),
        endTime: TimeOfDay(hour: 8, minute: 49),
        subjectName: 'Práctica Pedagógica Inv - Observación Pedagógica',
        day: 'TUE',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 9,
        startTime: TimeOfDay(hour: 8, minute: 50),
        endTime: TimeOfDay(hour: 9, minute: 44),
        subjectName: 'Práctica Pedagógica Inv - Observación Pedagógica',
        day: 'TUE',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 10,
        startTime: TimeOfDay(hour: 9, minute: 45),
        endTime: TimeOfDay(hour: 10, minute: 39),
        subjectName: 'Práctica Pedagógica Inv - Observación Pedagógica',
        day: 'TUE',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 11,
        startTime: TimeOfDay(hour: 11, minute: 10),
        endTime: TimeOfDay(hour: 12, minute: 4),
        subjectName: 'Socialización I',
        day: 'TUE',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 12,
        startTime: TimeOfDay(hour: 12, minute: 5),
        endTime: TimeOfDay(hour: 12, minute: 54),
        subjectName: 'Socialización I',
        day: 'TUE',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 13,
        startTime: TimeOfDay(hour: 14, minute: 50),
        endTime: TimeOfDay(hour: 15, minute: 44),
        subjectName: 'Educación Matemática I',
        day: 'TUE',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 14,
        startTime: TimeOfDay(hour: 15, minute: 45),
        endTime: TimeOfDay(hour: 16, minute: 39),
        subjectName: 'Educación Matemática I',
        day: 'TUE',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 15,
        startTime: TimeOfDay(hour: 16, minute: 40),
        endTime: TimeOfDay(hour: 17, minute: 34),
        subjectName: 'Educación Preescolar I',
        day: 'TUE',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 16,
        startTime: TimeOfDay(hour: 17, minute: 35),
        endTime: TimeOfDay(hour: 18, minute: 29),
        subjectName: 'Educación Preescolar I',
        day: 'TUE',
      ),
    ],
  ),
  const DayTimeSlots(
    date: '2024-06-27',
    subjectGroupTimeSlots: [
      StudentScheduleView(
        subjectGroupTimeSlotId: 23,
        startTime: TimeOfDay(hour: 7, minute: 0),
        endTime: TimeOfDay(hour: 7, minute: 54),
        subjectName: 'Comunicación y Lenguaje I',
        day: 'THU',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 24,
        startTime: TimeOfDay(hour: 7, minute: 55),
        endTime: TimeOfDay(hour: 8, minute: 49),
        subjectName: 'Comunicación y Lenguaje I',
        day: 'THU',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 25,
        startTime: TimeOfDay(hour: 8, minute: 50),
        endTime: TimeOfDay(hour: 9, minute: 44),
        subjectName: 'Didáctica General',
        day: 'THU',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 26,
        startTime: TimeOfDay(hour: 9, minute: 45),
        endTime: TimeOfDay(hour: 10, minute: 39),
        subjectName: 'Didáctica General',
        day: 'THU',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 27,
        startTime: TimeOfDay(hour: 11, minute: 10),
        endTime: TimeOfDay(hour: 12, minute: 4),
        subjectName: 'Educación Física',
        day: 'THU',
      ),
      StudentScheduleView(
        subjectGroupTimeSlotId: 28,
        startTime: TimeOfDay(hour: 12, minute: 5),
        endTime: TimeOfDay(hour: 12, minute: 54),
        subjectName: 'Educación Física',
        day: 'THU',
      ),
    ],
  ),
];
