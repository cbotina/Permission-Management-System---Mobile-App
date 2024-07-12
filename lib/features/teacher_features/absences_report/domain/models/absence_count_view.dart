import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pms_app/features/student_features/student_profile/domain/models/student.dart';

part 'absence_count_view.freezed.dart';
part 'absence_count_view.g.dart';

@freezed
class AbsenceCountView with _$AbsenceCountView {
  const factory AbsenceCountView({
    required String absences,
    required String student,
    required Gender studentGender,
  }) = _AbsenceCountView;

  factory AbsenceCountView.fromJson(Map<String, dynamic> json) =>
      _$AbsenceCountViewFromJson(json);
  // factory AbsenceCountView.fromJson(Map<String, dynamic> json) {
  //   return AbsenceCountView(
  //     absences: int.parse(json['absences']),
  //     student: json['student'],
  //     studentGender: json['studentGender'],
  //   );
  // }
}
