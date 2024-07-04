import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/student_schedule/domain/models/time_slot.dart';

final periodTimeSlotsProvider = FutureProvider<List<TimeSlot>>((ref) async {
  const periodId = 1;

  final response =
      await ref.watch(timeSlotsRepositoryProvider).getPeriodTimeSlots(periodId);

  return response.items;
});
