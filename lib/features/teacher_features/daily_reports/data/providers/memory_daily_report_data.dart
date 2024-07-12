import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/student_with_permission.dart';

class MemoryDailyreportDataNotifier extends ChangeNotifier {
  List<MemoryDailyReportData> data = [];

  void setData(List<StudentWithPermission> students) {
    for (var student in students) {
      data.add(MemoryDailyReportData(data: student));
    }
    notifyListeners();
  }

  void addComment(String comment, int index) {
    final updated = data.removeAt(index);
    data.insert(index, updated.copyWithComment(comment));
    notifyListeners();
  }

  void setAbsent(bool absent, int index) {
    final updated = data.removeAt(index);
    data.insert(index, updated.copyWithAbsent(absent));
    notifyListeners();
  }

  void clearData() {
    data = [];
    notifyListeners();
  }
}

final memoryDailyReportDataProvider =
    ChangeNotifierProvider<MemoryDailyreportDataNotifier>((ref) {
  return MemoryDailyreportDataNotifier();
});

@immutable
class MemoryDailyReportData {
  final StudentWithPermission data;
  final bool? absent;
  final String? comment;

  const MemoryDailyReportData({
    required this.data,
    this.absent,
    this.comment,
  });

  MemoryDailyReportData copyWithAbsent(bool absent) =>
      MemoryDailyReportData(data: data, absent: absent);

  MemoryDailyReportData copyWithComment(String comment) =>
      MemoryDailyReportData(data: data, absent: absent, comment: comment);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MemoryDailyReportData &&
        other.data == data &&
        other.absent == absent &&
        other.comment == comment;
  }

  @override
  int get hashCode => data.hashCode ^ absent.hashCode ^ comment.hashCode;
}
