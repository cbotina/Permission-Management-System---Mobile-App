import 'package:freezed_annotation/freezed_annotation.dart';

part 'absence_count_view.freezed.dart';

@freezed
class AbsenceCountView with _$AbsenceCountView {
  const factory AbsenceCountView({
    required int absences,
    required String student,
  }) = _AbsenceCountView;

  factory AbsenceCountView.fromJson(Map<String, dynamic> json) {
    return AbsenceCountView(
      absences: int.parse(json['absences']),
      student: json['student'],
    );
  }
}
