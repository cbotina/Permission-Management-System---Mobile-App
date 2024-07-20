import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/errors/error_widget.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/data/providers/time_slots_with_teacher_schedule_provider.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/presentation/widgets/components/teacher_schedule_wimt_slot_widget.dart';

const days = ['MON', 'TUE', 'WED', 'THU', 'FRI'];

class TeacherSchedulePage extends ConsumerStatefulWidget {
  const TeacherSchedulePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TeacherSchedulePageState();
}

class _TeacherSchedulePageState extends ConsumerState<TeacherSchedulePage> {
  Future<void> refresh() async {
    ref.invalidate(timeSlotsWithTeacherScheduleProvider);
  }

  String selectedDay = days[0];

  @override
  Widget build(BuildContext context) {
    final schedule =
        ref.watch(timeSlotsWithTeacherScheduleProvider(selectedDay));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Horario"),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SegmentedButton(
                    style: SegmentedButton.styleFrom(
                      selectedBackgroundColor:
                          Theme.of(context).colorScheme.primary,
                      selectedForegroundColor:
                          Theme.of(context).colorScheme.onPrimary,
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      // backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    segments: [
                      ButtonSegment(
                        value: days[0],
                        label: const Text("LUNES"),
                      ),
                      ButtonSegment(
                        value: days[1],
                        label: const Text("MARTES"),
                      ),
                      ButtonSegment(
                        value: days[2],
                        label: const Text("MIERCOLES"),
                      ),
                      ButtonSegment(
                        value: days[3],
                        label: const Text("JUEVES"),
                      ),
                      ButtonSegment(
                        value: days[4],
                        label: const Text("VIERNES"),
                      ),
                    ],
                    selected: {selectedDay},
                    onSelectionChanged: (newSelection) {
                      setState(() {
                        selectedDay = newSelection.first;
                      });
                    },
                  ),
                ],
              ),
            ),
            schedule.when(
              data: (data) {
                return Column(
                  children: data.map((e) {
                    return TeacherScheduleTimeSlotWidget(data: e);
                  }).toList(),
                );
              },
              error: (error, stackTrace) => ErrorWidgetUI(onRefresh: refresh),
              loading: () => const Center(child: CircularProgressIndicator()),
              skipLoadingOnRefresh: false,
            ),
          ],
        ),
      ),
    );
  }
}
