import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_group_student_absences_search_options.freezed.dart';

@freezed
class SubjectGroupStudentAbsenceSearchOptions
    with _$SubjectGroupStudentAbsenceSearchOptions {
  const factory SubjectGroupStudentAbsenceSearchOptions({
    required int studentId,
    required int subjectGroupId,
  }) = _SubjectGroupStudentAbsenceSearchOptions;
}
