import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/student_features/permission_requests/domain/models/student_schedule_view.dart';
import 'package:pms_app/features/session/data/providers/active_period_id_provider.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';
import 'package:pms_app/features/student_features/student_schedule/data/providers/time_slots_repository.dart';
import 'package:pms_app/features/student_features/student_schedule/domain/models/time_slot_with_student_schedule.dart';

final timeSlotsWithScheduleProvider =
    FutureProvider.family<List<TimeSlotWithStudentSchedule>, String>((
  ref,
  day,
) async {
  final periodId = ref.watch(activePeriodIdProvider);
  final studentId = ref.watch(entityIdProvider);

  final timeSlots = ref.watch(periodTimeSlotsProvider);

  final studentSchedule = await ref
      .watch(studentScheduleRepositoryProvider)
      .getStudentSchedule(periodId, studentId, day);

  return timeSlots.when(
    data: (data) {
      return data.map((e) {
        StudentScheduleView? studentScheduleView;

        for (var sc in studentSchedule) {
          if (sc.startTime == e.startTime && sc.endTime == e.endTime) {
            studentScheduleView = sc;
          }
        }
        return TimeSlotWithStudentSchedule(
            timeSlot: e, studentSchedule: studentScheduleView);
      }).toList();
    },
    error: (error, stackTrace) {
      print(error);
      return [];
    },
    loading: () => [],
  );
});
