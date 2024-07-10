import 'package:flutter/foundation.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/teacher_daily_report_view.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/domain/models/teacher_schedule_view.dart';

@immutable
class ScheduleWithDailyReport {
  final TeacherScheduleView scheduleView;
  final TeacherDailyReportView? dailyReportView;

  const ScheduleWithDailyReport({
    required this.scheduleView,
    required this.dailyReportView,
  });

  @override
  String toString() {
    return '$scheduleView, $dailyReportView';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScheduleWithDailyReport &&
        other.scheduleView == scheduleView &&
        other.dailyReportView == dailyReportView;
  }

  @override
  int get hashCode => scheduleView.hashCode ^ dailyReportView.hashCode;
}
