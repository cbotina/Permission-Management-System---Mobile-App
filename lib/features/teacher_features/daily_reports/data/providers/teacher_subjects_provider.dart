import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/session/data/providers/active_period_id_provider.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/teacher_subjects_view.dart';

final teacherSubjectsProvider =
    FutureProvider<List<TeacherSubjectsView>>((ref) async {
  final periodId = ref.watch(activePeriodIdProvider);
  final teacherId = ref.watch(entityIdProvider);

  return await ref
      .watch(teacherSubjectsRepositoryProvider)
      .getTeacherSubjectGroups(periodId, teacherId);
});
