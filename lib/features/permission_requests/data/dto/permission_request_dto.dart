import 'dart:collection';

class PermissionRequestDto extends MapView<String, dynamic> {
  final String reason;
  final String evidenceUrl;
  final String? studentNote;
  final List<AbsenceTimeSlot> absenceTimeSlots;

  PermissionRequestDto({
    required this.reason,
    required this.evidenceUrl,
    this.studentNote,
    required this.absenceTimeSlots,
  }) : super({
          "reason": reason,
          "evidenceUrl": evidenceUrl,
          "studentNote": studentNote,
          "absenceTimeSlots": absenceTimeSlots,
        });
}

class AbsenceTimeSlot extends MapView<String, dynamic> {
  final int subjectGroupTimeSlotId;
  final DateTime absenceDate;

  AbsenceTimeSlot({
    required this.subjectGroupTimeSlotId,
    required this.absenceDate,
  }) : super({
          "subjectGroupTimeSlotId": subjectGroupTimeSlotId,
          "absenceDate": absenceDate.toString(),
        });
}
