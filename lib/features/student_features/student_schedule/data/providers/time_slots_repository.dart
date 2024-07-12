import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/session/data/providers/active_period_id_provider.dart';
import 'package:pms_app/features/student_features/student_schedule/domain/models/time_slot.dart';

final periodTimeSlotsProvider = FutureProvider<List<TimeSlot>>((ref) async {
  final periodId = ref.watch(activePeriodIdProvider);

  final response =
      await ref.watch(timeSlotsRepositoryProvider).getPeriodTimeSlots(periodId);

  return response.items;
});
