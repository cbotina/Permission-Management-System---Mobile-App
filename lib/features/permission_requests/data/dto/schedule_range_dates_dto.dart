import 'package:flutter/material.dart';

@immutable
class ScheduleRangeDatesDto {
  final DateTime startDate;
  final DateTime endDate;
  const ScheduleRangeDatesDto({
    required this.startDate,
    required this.endDate,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScheduleRangeDatesDto &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode => startDate.hashCode ^ endDate.hashCode;
}
