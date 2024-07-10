import 'package:flutter/material.dart';

class SubjectGroupTimeSlotView {
  final int id;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String subjectName;

  SubjectGroupTimeSlotView(
      {required this.id,
      required this.startTime,
      required this.endTime,
      required this.subjectName});
}
