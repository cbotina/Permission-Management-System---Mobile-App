import 'package:pms_app/features/teacher_features/absences_report/data/abstract_repositories/absence_count_repository.dart';
import 'package:pms_app/features/teacher_features/absences_report/domain/models/absence_count_view.dart';

class MockAbsenceCountRepository implements IAbsenceCountRepository {
  @override
  Future<List<AbsenceCountView>> getSubjectAbsenceCount(int subjetcId) async {
    return absenceCountList;
  }
}

final List<AbsenceCountView> absenceCountList = [
  AbsenceCountView.fromJson(
      {"absences": "2", "student": "Nicol Alejandra Bastidas Erazo"}),
  AbsenceCountView.fromJson(
      {"absences": "2", "student": "Claudia Adriana Jackson"}),
  AbsenceCountView.fromJson(
      {"absences": "2", "student": "Vicky Zuleima Davila Hernandez"}),
  AbsenceCountView.fromJson(
      {"absences": "1", "student": "Juan Andres Bravo Martinez"}),
  AbsenceCountView.fromJson(
      {"absences": "1", "student": "Geraldine Tatiana Roque Tello"}),
];
