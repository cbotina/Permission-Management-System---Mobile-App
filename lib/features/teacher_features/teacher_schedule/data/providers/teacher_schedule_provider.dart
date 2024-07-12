import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/session/data/providers/active_period_id_provider.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/domain/models/teacher_schedule_view.dart';

final teacherScheduleProvider =
    FutureProvider.family<List<TeacherScheduleView>, String>((ref, day) async {
  final periodId = ref.watch(activePeriodIdProvider);
  final teacherId = ref.watch(entityIdProvider);

  return await ref
      .watch(teacherScheduleRepositoryProvider)
      .getTeacherSchedule(periodId, teacherId, day);
});
