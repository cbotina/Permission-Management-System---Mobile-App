import "dart:collection";

class CreateDailyReportDto extends MapView<String, dynamic> {
  final DateTime reportDate;
  final bool isSubmitted;
  final int subjectGroupTimeSlotId;
  final List<StudentAbsence> studentsAbsences;

  CreateDailyReportDto({
    required this.reportDate,
    required this.isSubmitted,
    required this.subjectGroupTimeSlotId,
    required this.studentsAbsences,
  }) : super({
          "reportDate": reportDate.toString(),
          "isSubmitted": isSubmitted,
          "subjectGroupTimeSlotId": subjectGroupTimeSlotId,
          "studentsAbsences": studentsAbsences,
        });
}

class StudentAbsence extends MapView<String, dynamic> {
  final int studentId;
  final String? teacherComment;

  StudentAbsence({
    required this.studentId,
    this.teacherComment,
  }) : super({
          "studentId": studentId,
          "teacherComment": teacherComment,
        });
}
