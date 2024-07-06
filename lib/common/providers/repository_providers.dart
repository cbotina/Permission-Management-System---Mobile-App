import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/auth/data/abstract_repositories/auth_repository.dart';
import 'package:pms_app/features/auth/data/repositories/impl_auth_repository.dart';
import 'package:pms_app/features/permission_requests/data/abstract_repositories/day_time_slots_repository.dart';
import 'package:pms_app/features/permission_requests/data/abstract_repositories/permission_request_repository.dart';
import 'package:pms_app/features/permission_requests/data/repositories/impl_day_time_slots_repository.dart';
import 'package:pms_app/features/permission_requests/data/repositories/impl_permission_request_repository.dart';
import 'package:pms_app/features/session/data/abstract_repositories/periods_repository.dart';
import 'package:pms_app/features/session/data/repositories/impl_periods_repository.dart';
import 'package:pms_app/features/student_permissions/data/abstract_repositories/permission_absences_repository.dart';
import 'package:pms_app/features/student_permissions/data/abstract_repositories/permission_repository.dart';
import 'package:pms_app/features/student_permissions/data/repositories/impl_permission_absences_repository.dart';
import 'package:pms_app/features/student_permissions/data/repositories/impl_permissions_repository.dart';
import 'package:pms_app/features/student_profile/data/abstract_repositories/students_repository.dart';
import 'package:pms_app/features/student_profile/data/repositories/impl_students_repository.dart';
import 'package:pms_app/features/student_schedule/data/abstract_repositories/student_schedule_repository.dart';
import 'package:pms_app/features/student_schedule/data/abstract_repositories/time_slots_repository.dart';
import 'package:pms_app/features/student_schedule/data/repositories/impl_student_schedule_repository.dart';
import 'package:pms_app/features/student_schedule/data/repositories/impl_time_slots_repository.dart';
import 'package:pms_app/features/student_unjustified_absences/data/abstract_repositories/unjustified_absences_repository.dart';
import 'package:pms_app/features/student_unjustified_absences/data/repositories/impl_unjustified_absences_repository.dart';
import 'package:pms_app/features/users/data/abstract_repositories/users_repository.dart';
import 'package:pms_app/features/users/data/repositories/impl_users_repository.dart';

final permissionsRepositoryProvider = Provider<IPermissionsRepository>((ref) {
  return ImplPermissionsRepository();
});

final permissionAbsencesRepositoryProvider =
    Provider<IPermissionAbsencesRepository>((ref) {
  return ImplPermissionAbsencesRepository();
});

final dayTimeSlotsRepositoryProvider = Provider<IDayTimeSlotsRepository>((ref) {
  return ImplDayTimeSlotsRepository();
});

final unjustifiedAbsencesRepositoryProvider =
    Provider<IUnjustifiedAbsencesRepository>((ref) {
  return ImplUnjustifiedAbsencesRepository();
});

final studentsRepositoryProvider = Provider<IStudentsRepository>((ref) {
  return ImplStudentsRepository();
});

final usersRepositoryProvider = Provider<IUsersRepository>((ref) {
  return ImplUsersRepository();
});

final studentScheduleRepositoryProvider =
    Provider<IStudentScheduleRepository>((ref) {
  return ImplStudentScheduleRepository();
});

final permissionRequestRepositoryProvider =
    Provider<IPermissionRequestRepository>((ref) {
  return ImplPermissionRequestRepository();
});

final timeSlotsRepositoryProvider = Provider<ITimeSlotsRepository>((ref) {
  return ImplTimeSlotsRepository();
});

final periodsRepositoryProvider = Provider<IPeriodsRepository>((ref) {
  return ImplPeriodsRepository();
});

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ImplAuthRepository();
});
