import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/auth/data/abstract_repositories/auth_repository.dart';
import 'package:pms_app/features/auth/data/repositories/impl_auth_repository.dart';
import 'package:pms_app/features/student_features/permission_requests/data/abstract_repositories/day_time_slots_repository.dart';
import 'package:pms_app/features/student_features/permission_requests/data/abstract_repositories/permission_request_repository.dart';
import 'package:pms_app/features/student_features/permission_requests/data/repositories/impl_day_time_slots_repository.dart';
import 'package:pms_app/features/student_features/permission_requests/data/repositories/impl_permission_request_repository.dart';
import 'package:pms_app/features/session/data/abstract_repositories/periods_repository.dart';
import 'package:pms_app/features/session/data/repositories/impl_periods_repository.dart';
import 'package:pms_app/features/student_features/student_permissions/data/abstract_repositories/permission_absences_repository.dart';
import 'package:pms_app/features/student_features/student_permissions/data/abstract_repositories/permission_repository.dart';
import 'package:pms_app/features/student_features/student_permissions/data/repositories/impl_permission_absences_repository.dart';
import 'package:pms_app/features/student_features/student_permissions/data/repositories/impl_permissions_repository.dart';
import 'package:pms_app/features/student_features/student_profile/data/abstract_repositories/students_repository.dart';
import 'package:pms_app/features/student_features/student_profile/data/repositories/impl_students_repository.dart';
import 'package:pms_app/features/student_features/student_schedule/data/abstract_repositories/student_schedule_repository.dart';
import 'package:pms_app/features/student_features/student_schedule/data/abstract_repositories/time_slots_repository.dart';
import 'package:pms_app/features/student_features/student_schedule/data/repositories/impl_student_schedule_repository.dart';
import 'package:pms_app/features/student_features/student_schedule/data/repositories/impl_time_slots_repository.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/abstract_repositories/unjustified_absences_repository.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/data/repositories/impl_unjustified_absences_repository.dart';
import 'package:pms_app/features/teacher_features/absences_report/data/abstract_repositories/absence_count_repository.dart';
import 'package:pms_app/features/teacher_features/absences_report/data/repositories/impl_absence_count_repository.dart';
import 'package:pms_app/features/teacher_features/absences_report/data/repositories/impl_subject_group_student_absences_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/abstract_repositories/daily_report_permissions_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/abstract_repositories/daily_reports_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/abstract_repositories/subject_group_students_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/abstract_repositories/teacher_daily_reports_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/abstract_repositories/teacher_subjects_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/repositories/impl_daily_report_permissions_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/repositories/impl_daily_reports_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/repositories/impl_subject_group_students_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/repositories/impl_teacher_daily_reports_repository.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/repositories/impl_teacher_subjects_repository.dart';
import 'package:pms_app/features/teacher_features/teacher_profile/data/abstract_repositories/teachers_repository.dart';
import 'package:pms_app/features/teacher_features/teacher_profile/data/repositories/impl_teachers_repository.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/data/abstract_repositories/teacher_schedule_repository.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/data/repositories/impl_teacher_schedule_repository.dart';
import 'package:pms_app/features/users/data/abstract_repositories/users_repository.dart';
import 'package:pms_app/features/users/data/repositories/impl_users_repository.dart';

final permissionsRepositoryProvider = Provider<IPermissionsRepository>((ref) {
  return ImplPermissionsRepository(ref: ref);
});

final permissionAbsencesRepositoryProvider =
    Provider<IPermissionAbsencesRepository>((ref) {
  return ImplPermissionAbsencesRepository(ref: ref);
});

final dayTimeSlotsRepositoryProvider = Provider<IDayTimeSlotsRepository>((ref) {
  return ImplDayTimeSlotsRepository(ref: ref);
});

final unjustifiedAbsencesRepositoryProvider =
    Provider<IUnjustifiedAbsencesRepository>((ref) {
  return ImplUnjustifiedAbsencesRepository(ref: ref);
});

final studentsRepositoryProvider = Provider<IStudentsRepository>((ref) {
  return ImplStudentsRepository(ref: ref);
});

final usersRepositoryProvider = Provider<IUsersRepository>((ref) {
  return ImplUsersRepository(ref: ref);
});

final studentScheduleRepositoryProvider =
    Provider<IStudentScheduleRepository>((ref) {
  return ImplStudentScheduleRepository(ref: ref);
});

final permissionRequestRepositoryProvider =
    Provider<IPermissionRequestRepository>((ref) {
  return ImplPermissionRequestRepository(ref: ref);
});

final timeSlotsRepositoryProvider = Provider<ITimeSlotsRepository>((ref) {
  return ImplTimeSlotsRepository(ref: ref);
});

final periodsRepositoryProvider = Provider<IPeriodsRepository>((ref) {
  return ImplPeriodsRepository(ref: ref);
});

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ImplAuthRepository();
});

final teacherDailyReportsRepositoryProvider =
    Provider<ITeacherDailyReportsRepository>((ref) {
  return ImplTeacherDailyReportsRepository(ref: ref);
});

final teacherScheduleRepositoryProvider =
    Provider<ITeacherScheduleRepository>((ref) {
  return ImplTeacherScheduleRepository(ref: ref);
});

final subjectGroupStudentsRepositoryProvider =
    Provider<ISubjectGroupStudentsRepository>((ref) {
  return ImplSubjectGroupStudentsRepository(ref: ref);
});

final dailyReportPermissionsRepositoryProvider =
    Provider<IDailyReportPermissionsRepository>((ref) {
  return ImplDailyReportPermissionsRepository(ref: ref);
});

final teacherSubjectsRepositoryProvider =
    Provider<ITeacherSubjectsRepository>((ref) {
  return ImplTeacherSubjectsRepository(ref: ref);
});

final absenceCountRepositoryProvider = Provider<IAbsenceCountRepository>((ref) {
  return ImplAbsenceCountRepository(ref: ref);
});

final subjectGroupStudentAbsencesRepositoryProvider =
    Provider<ImplSubjectGroupStudentAbsencesRepository>((ref) {
  return ImplSubjectGroupStudentAbsencesRepository(ref: ref);
});

final teachersRepositoryProvider = Provider<ITeachersRepository>((ref) {
  return ImplTeachersRepository(ref: ref);
});

final dailyReportsRepositoryProvider = Provider<IDailyReportsRepository>((ref) {
  return ImplDailyReportsRepository(ref: ref);
});
