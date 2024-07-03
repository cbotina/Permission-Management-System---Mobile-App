import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pms_app/common/extensions/string_to_time.dart';
part 'time_slot.freezed.dart';

@Freezed()
class TimeSlot with _$TimeSlot {
  const factory TimeSlot({
    required int id,
    required int periodId,
    required String tag,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required bool isAcademic,
  }) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    // print(json);
    return TimeSlot(
      periodId: 1,
      id: json['id'],
      tag: json['label'],
      startTime: json['startTime'].toString().toDayTime(),
      // startTime: TimeOfDay.now(),
      endTime: json['endTime'].toString().toDayTime(),
      // endTime: TimeOfDay.now(),
      isAcademic: json['isAcademic'],
    );
  }
}
