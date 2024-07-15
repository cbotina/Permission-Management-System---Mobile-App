import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/student_features/student_schedule/data/providers/time_slots_with_schedule_provider.dart';
import 'package:pms_app/features/student_features/student_schedule/presentation/widgets/components/student_schedule_time_slot.dart';

const days = ['MON', 'TUE', 'WED', 'THU', 'FRI'];

class StudentSchedulePage extends ConsumerStatefulWidget {
  const StudentSchedulePage({super.key});

  @override
  ConsumerState<StudentSchedulePage> createState() =>
      _StudentSchedulePageState();
}

class _StudentSchedulePageState extends ConsumerState<StudentSchedulePage> {
  String selectedDay = days[0];

  @override
  Widget build(BuildContext context) {
    final schedule = ref.watch(timeSlotsWithScheduleProvider(selectedDay));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Horario"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(timeSlotsWithScheduleProvider);
        },
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
                    return StudentScheduleTimeSlotWidget(data: e);
                  }).toList(),
                );
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
              skipLoadingOnRefresh: false,
            ),
          ],
        ),
      ),
    );
  }
}
