import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pms_app/common/extensions/string_to_gender.dart';
import 'package:pms_app/features/student_features/student_profile/domain/models/student.dart';

part 'absence_count_view.freezed.dart';

@freezed
class AbsenceCountView with _$AbsenceCountView {
  const factory AbsenceCountView({
    required int absences,
    required int studentId,
    required int subjectGroupId,
    required String student,
    required Gender studentGender,
  }) = _AbsenceCountView;

  factory AbsenceCountView.fromJson(Map<String, dynamic> json) {
    return AbsenceCountView(
      absences: int.parse(json['absences']),
      student: json['student'],
      studentId: json['studentId'],
      subjectGroupId: json['subjectGroupId'],
      studentGender: json['studentGender'].toString().toGender(),
    );
  }
}
