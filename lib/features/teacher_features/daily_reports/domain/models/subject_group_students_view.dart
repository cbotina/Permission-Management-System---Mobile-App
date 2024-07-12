import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pms_app/features/student_features/student_profile/domain/models/student.dart';

part 'subject_group_students_view.freezed.dart';
part 'subject_group_students_view.g.dart';

@freezed
class SubjectGroupStudentsView with _$SubjectGroupStudentsView {
  const factory SubjectGroupStudentsView({
    required int studentId,
    required String studentFirstName,
    required String studentLastName,
    required Gender studentGender,
  }) = _SubjectGroupStudentsView;

  factory SubjectGroupStudentsView.fromJson(Map<String, dynamic> json) =>
      _$SubjectGroupStudentsViewFromJson(json);
}
