import 'package:pms_app/common/models/pagination.dart';
import 'package:pms_app/features/student_features/student_permissions/domain/models/permission.dart';

abstract class IPermissionsRepository {
  Future<Pagination<Permission>> getStudentPeriodPermissions(
      int periodId, int studentId, int page);
}
