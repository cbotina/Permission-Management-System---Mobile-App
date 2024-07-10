import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_group_students_view.freezed.dart';
part 'subject_group_students_view.g.dart';

@freezed
class SubjectGroupStudentsView with _$SubjectGroupStudentsView {
  const factory SubjectGroupStudentsView({
    required int studentId,
    required String studentName,
  }) = _SubjectGroupStudentsView;

  factory SubjectGroupStudentsView.fromJson(Map<String, dynamic> json) =>
      _$SubjectGroupStudentsViewFromJson(json);
}
