import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher.freezed.dart';

@freezed
class Teacher with _$Teacher {
  const factory Teacher({
    required int id,
    required String cc,
    String? email,
    required String firstName,
    required String lastName,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json['id'] as int,
        cc: json['cc'] as String,
        email: json['email'] as String?,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
      );
}
