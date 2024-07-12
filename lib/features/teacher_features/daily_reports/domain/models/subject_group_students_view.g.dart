// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_group_students_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubjectGroupStudentsViewImpl _$$SubjectGroupStudentsViewImplFromJson(
        Map<String, dynamic> json) =>
    _$SubjectGroupStudentsViewImpl(
      studentId: (json['studentId'] as num).toInt(),
      studentFirstName: json['studentFirstName'] as String,
      studentLastName: json['studentLastName'] as String,
      studentGender: $enumDecode(_$GenderEnumMap, json['studentGender']),
    );

Map<String, dynamic> _$$SubjectGroupStudentsViewImplToJson(
        _$SubjectGroupStudentsViewImpl instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'studentFirstName': instance.studentFirstName,
      'studentLastName': instance.studentLastName,
      'studentGender': _$GenderEnumMap[instance.studentGender]!,
    };

const _$GenderEnumMap = {
  Gender.male: 'M',
  Gender.female: 'F',
};
