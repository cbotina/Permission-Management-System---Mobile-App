import 'package:hooks_riverpod/hooks_riverpod.dart';

final todayProvider = Provider<DateTime>((ref) {
  final today = DateTime.now();
  final year = today.year;
  final month = today.month;
  final day = today.day;

  return DateTime(year, month, 19);
});
