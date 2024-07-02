import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/features/student_unjustified_absences/domain/models/unjustified_absence_details_view.dart';

abstract class IUnjustifiedAbsencesRepository {
  Future<Pagination<UnjustifiedAbsenceDetailsView>>
      getStudentUnjustifiedAbsences(int periodId, int studentId, int page);
}
