import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/student_profile/domain/models/student.dart';

final studentInfoProvider =
    FutureProvider.family<Student, int>((ref, studentId) async {
  return await ref.watch(studentsRepositoryProvider).getStudent(studentId);
});
