import 'package:flutter/material.dart';
import 'package:pms_app/features/permission_requests/domain/models/subject_group_time_slot_view.dart';

class PermissionTimeSlotsNotifier extends ChangeNotifier {
  List<SubjectGroupTimeSlotView> subjectGroupTimeSlots = [];

  void add(SubjectGroupTimeSlotView sgts) {
    subjectGroupTimeSlots.insert(0, sgts);
    notifyListeners();
  }

  void reset() {
    subjectGroupTimeSlots = [];
  }
}
