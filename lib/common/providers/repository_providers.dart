import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/permission_requests/data/abstract_repositories/day_time_slots_repository.dart';
import 'package:pms_app/features/permission_requests/data/abstract_repositories/permission_request_repository.dart';
import 'package:pms_app/features/permission_requests/data/repositories/impl_day_time_slots_repository.dart';
import 'package:pms_app/features/permission_requests/data/repositories/impl_permission_request_repository.dart';
import 'package:pms_app/features/permission_requests/data/repositories/mock_day_time_slots_repository.dart';
import 'package:pms_app/features/student_permissions/data/abstract_repositories/permission_absences_repository.dart';
import 'package:pms_app/features/student_permissions/data/abstract_repositories/permission_repository.dart';
import 'package:pms_app/features/student_permissions/data/repositories/impl_permission_absences_repository.dart';
import 'package:pms_app/features/student_permissions/data/repositories/impl_permissions_repository.dart';
import 'package:pms_app/features/student_permissions/data/repositories/mock_permission_absences_repository.dart';
import 'package:pms_app/features/student_permissions/data/repositories/mock_permissions_repository.dart';
import 'package:pms_app/features/student_profile/data/abstract_repositories/students_repository.dart';
import 'package:pms_app/features/student_profile/data/repositories/impl_students_repository.dart';
import 'package:pms_app/features/student_profile/data/repositories/mock_students_repository.dart';
import 'package:pms_app/features/student_schedule/data/abstract_repositories/student_schedule_repository.dart';
import 'package:pms_app/features/student_schedule/data/repositories/impl_student_schedule_repository.dart';
import 'package:pms_app/features/student_schedule/data/repositories/mock_student_schedule_repository.dart';
import 'package:pms_app/features/student_unjustified_absences/data/abstract_repositories/unjustified_absences_repository.dart';
import 'package:pms_app/features/student_unjustified_absences/data/repositories/impl_unjustified_absences_repository.dart';
import 'package:pms_app/features/student_unjustified_absences/data/repositories/mock_unjustified_absences_repository.dart';
import 'package:pms_app/features/users/data/abstract_repositories/users_repository.dart';
import 'package:pms_app/features/users/data/repositories/impl_users_repository.dart';

final permissionsRepositoryProvider = Provider<IPermissionsRepository>((ref) {
  return MockPermissionsRepository();
});

final permissionAbsencesRepositoryProvider =
    Provider<IPermissionAbsencesRepository>((ref) {
  return MockPermissionAbsencesRepository();
});

final dayTimeSlotsRepositoryProvider = Provider<IDayTimeSlotsRepository>((ref) {
  return MockDayTimeSlotsRepository();
});

final unjustifiedAbsencesRepositoryProvider =
    Provider<IUnjustifiedAbsencesRepository>((ref) {
  return MockUnjustifiedAbsencesRepository();
});

final studentsRepositoryProvider = Provider<IStudentsRepository>((ref) {
  return MockStudentsRepository();
});

final usersRepositoryProvider = Provider<IUsersRepository>((ref) {
  return ImplUsersRepository();
});

final studentScheduleRepositoryProvider =
    Provider<IStudentScheduleRepository>((ref) {
  return MockStudentScheduleRepository();
});

final permissionRequestRepositoryProvider =
    Provider<IPermissionRequestRepository>((ref) {
  return ImplPermissionRequestRepository();
});
