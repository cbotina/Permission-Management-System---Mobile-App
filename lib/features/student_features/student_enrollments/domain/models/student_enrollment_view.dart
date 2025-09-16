import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_enrollment_view.freezed.dart';
part 'student_enrollment_view.g.dart';

@freezed
class StudentEnrollmentView with _$StudentEnrollmentView {
  const factory StudentEnrollmentView({
    required int enrollmentId,
    required String subjectName,
    required String teacherName,
    required int periodId,
    required int studentId,
  }) = _StudentEnrollmentView;

  factory StudentEnrollmentView.fromJson(Map<String, dynamic> json) =>
      _$StudentEnrollmentViewFromJson(json);
}
