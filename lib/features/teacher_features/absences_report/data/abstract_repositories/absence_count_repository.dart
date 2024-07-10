import 'package:pms_app/features/teacher_features/absences_report/domain/models/absence_count_view.dart';

abstract class IAbsenceCountRepository {
  Future<List<AbsenceCountView>> getSubjectAbsenceCount(int subjetcId);
}
