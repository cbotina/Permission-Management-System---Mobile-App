import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_subjects_view.freezed.dart';
part 'teacher_subjects_view.g.dart';

@freezed
class TeacherSubjectsView with _$TeacherSubjectsView {
  const factory TeacherSubjectsView({
    required int subjectGroupId,
    required String subjectName,
    required String groupName,
  }) = _TeacherSubjectsView;

  factory TeacherSubjectsView.fromJson(Map<String, dynamic> json) =>
      _$TeacherSubjectsViewFromJson(json);
}
