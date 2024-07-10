// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report_permission_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyReportPermissionViewImpl _$$DailyReportPermissionViewImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyReportPermissionViewImpl(
      dailyReportId: (json['dailyReportId'] as num).toInt(),
      absenceId: (json['absenceId'] as num).toInt(),
      studentId: (json['studentId'] as num).toInt(),
      studentName: json['studentName'] as String,
      permissionReason: json['permissionReason'] as String,
      permissionStatus: json['permissionStatus'] as String,
      permissionId: (json['permissionId'] as num).toInt(),
    );

Map<String, dynamic> _$$DailyReportPermissionViewImplToJson(
        _$DailyReportPermissionViewImpl instance) =>
    <String, dynamic>{
      'dailyReportId': instance.dailyReportId,
      'absenceId': instance.absenceId,
      'studentId': instance.studentId,
      'studentName': instance.studentName,
      'permissionReason': instance.permissionReason,
      'permissionStatus': instance.permissionStatus,
      'permissionId': instance.permissionId,
    };
