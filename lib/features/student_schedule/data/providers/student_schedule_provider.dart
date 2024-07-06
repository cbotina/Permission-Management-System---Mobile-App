import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/permission_requests/domain/models/student_schedule_view.dart';
import 'package:pms_app/features/session/data/providers/active_period_id_provider.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';

final studentScheduleProvider =
    FutureProvider.family<List<StudentScheduleView>, String>((ref, day) async {
  final periodId = ref.watch(activePeriodIdProvider);
  final studentId = ref.watch(entityIdProvider);

  return await ref
      .watch(studentScheduleRepositoryProvider)
      .getStudentSchedule(periodId, studentId, day);
});
