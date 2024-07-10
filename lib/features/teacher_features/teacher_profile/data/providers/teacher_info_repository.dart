import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/teacher_features/teacher_profile/domain/models/teacher.dart';

final teacherInfoProvider =
    FutureProvider.family<Teacher, int>((ref, teacherId) async {
  return await ref.watch(teachersRepositoryProvider).getTeacher(teacherId);
});
