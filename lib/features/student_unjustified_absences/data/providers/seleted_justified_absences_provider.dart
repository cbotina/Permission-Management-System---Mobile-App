import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectedJustifiableAbsencesNotifier extends ChangeNotifier {
  List<int> selectedAbsencesIds = [];

  void add(int id) {
    selectedAbsencesIds.insert(0, id);
    notifyListeners();
  }

  void remove(int id) {
    selectedAbsencesIds.remove(id);

    notifyListeners();
  }

  void reset() {
    selectedAbsencesIds = [];
    notifyListeners();
  }
}

final selectedJustifiableAbsencesIdsProvider =
    ChangeNotifierProvider<SelectedJustifiableAbsencesNotifier>((ref) {
  return SelectedJustifiableAbsencesNotifier();
});
