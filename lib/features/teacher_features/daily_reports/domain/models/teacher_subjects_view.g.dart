// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_subjects_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeacherSubjectsViewImpl _$$TeacherSubjectsViewImplFromJson(
        Map<String, dynamic> json) =>
    _$TeacherSubjectsViewImpl(
      subjectGroupId: (json['subjectGroupId'] as num).toInt(),
      subjectName: json['subjectName'] as String,
      groupName: json['groupName'] as String,
    );

Map<String, dynamic> _$$TeacherSubjectsViewImplToJson(
        _$TeacherSubjectsViewImpl instance) =>
    <String, dynamic>{
      'subjectGroupId': instance.subjectGroupId,
      'subjectName': instance.subjectName,
      'groupName': instance.groupName,
    };
