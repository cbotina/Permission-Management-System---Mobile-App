import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/features/student_features/student_permissions/domain/models/permission_absence_view.dart';

abstract class IPermissionAbsencesRepository {
  Future<Pagination<PermissionAbsenceView>> getStudentPermissionAbsences(
    int studentId,
    int permissionId,
    int page,
  );
}
