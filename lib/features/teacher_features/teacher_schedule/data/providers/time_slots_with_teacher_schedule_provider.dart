import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/session/data/providers/active_period_id_provider.dart';
import 'package:pms_app/features/session/data/providers/entity_id_provider.dart';
import 'package:pms_app/features/student_features/student_schedule/data/providers/time_slots_repository.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/domain/models/teacher_schedule_view.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/domain/models/time_slot_with_teacher_schedule.dart';

final timeSlotsWithTeacherScheduleProvider =
    FutureProvider.family<List<TimeSlotWithTeacherSchedule>, String>((
  ref,
  day,
) async {
  final periodId = ref.watch(activePeriodIdProvider);
  final teacherId = ref.watch(entityIdProvider);

// todo: usar repositorio en lugar de un asyncvalue
  final timeSlots = ref.watch(periodTimeSlotsProvider);

  final studentSchedule = await ref
      .watch(teacherScheduleRepositoryProvider)
      .getTeacherSchedule(periodId, teacherId, day);

  return timeSlots.when(
    data: (data) {
      return data.map((e) {
        TeacherScheduleView? studentScheduleView;

        for (var sc in studentSchedule) {
          if (sc.startTime == e.startTime && sc.endTime == e.endTime) {
            studentScheduleView = sc;
          }
        }
        return TimeSlotWithTeacherSchedule(
            timeSlot: e, teacherSchedule: studentScheduleView);
      }).toList();
    },
    error: (error, stackTrace) {
      throw error;
    },
    loading: () => [],
  );
});
