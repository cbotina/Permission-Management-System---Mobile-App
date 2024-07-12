// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absence_count_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsenceCountViewImpl _$$AbsenceCountViewImplFromJson(
        Map<String, dynamic> json) =>
    _$AbsenceCountViewImpl(
      absences: json['absences'] as String,
      student: json['student'] as String,
      studentGender: $enumDecode(_$GenderEnumMap, json['studentGender']),
    );

Map<String, dynamic> _$$AbsenceCountViewImplToJson(
        _$AbsenceCountViewImpl instance) =>
    <String, dynamic>{
      'absences': instance.absences,
      'student': instance.student,
      'studentGender': _$GenderEnumMap[instance.studentGender]!,
    };

const _$GenderEnumMap = {
  Gender.male: 'M',
  Gender.female: 'F',
};
