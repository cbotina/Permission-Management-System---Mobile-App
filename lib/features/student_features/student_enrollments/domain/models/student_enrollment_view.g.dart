// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_enrollment_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentEnrollmentViewImpl _$$StudentEnrollmentViewImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentEnrollmentViewImpl(
      enrollmentId: (json['enrollmentId'] as num).toInt(),
      subjectName: json['subjectName'] as String,
      teacherName: json['teacherName'] as String,
      periodId: (json['periodId'] as num).toInt(),
      studentId: (json['studentId'] as num).toInt(),
    );

Map<String, dynamic> _$$StudentEnrollmentViewImplToJson(
        _$StudentEnrollmentViewImpl instance) =>
    <String, dynamic>{
      'enrollmentId': instance.enrollmentId,
      'subjectName': instance.subjectName,
      'teacherName': instance.teacherName,
      'periodId': instance.periodId,
      'studentId': instance.studentId,
    };
