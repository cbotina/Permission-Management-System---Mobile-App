import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/permission_requests/domain/models/student_schedule_view.dart';

final studentScheduleProvider =
    FutureProvider.family<List<StudentScheduleView>, String>((ref, day) async {
  const int periodId = 1;
  const int studentId = 1;

  return await ref
      .watch(studentScheduleRepositoryProvider)
      .getStudentSchedule(periodId, studentId, day);
});
