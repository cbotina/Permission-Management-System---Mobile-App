import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/data/providers/time_slots_with_teacher_schedule_provider.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/domain/models/time_slot_with_teacher_schedule.dart';

const days = ['MON', 'TUE', 'WED', 'THU', 'FRI'];

class TeacherSchedulePage extends ConsumerStatefulWidget {
  const TeacherSchedulePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TeacherSchedulePageState();
}

class _TeacherSchedulePageState extends ConsumerState<TeacherSchedulePage> {
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
        onRefresh: () async {
          ref.invalidate(timeSlotsWithTeacherScheduleProvider);
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
                    return TeacherScheduleTimeSlotWidget(
                      data: e,
                    );
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

class TeacherScheduleTimeSlotWidget extends StatelessWidget {
  final TimeSlotWithTeacherSchedule data;
  const TeacherScheduleTimeSlotWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Divider(
            thickness: 1,
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: 100,
                child: Text(
                  data.timeSlot.startTime.format(context).padLeft(8, '0'),
                ),
              ),
              Expanded(
                child: Container(
                  height: 80,
                  color: data.teacherSchedule != null
                      ? const Color.fromARGB(255, 240, 255, 242)
                      : const Color.fromARGB(255, 243, 249, 255),
                  child: Row(
                    children: [
                      Container(
                        color: data.teacherSchedule != null
                            ? Theme.of(context).colorScheme.primary
                            : Colors.blue,
                        width: 6,
                        height: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 156,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: data.teacherSchedule != null
                                ? [
                                    Text(
                                      data.teacherSchedule!.subjectName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      data.teacherSchedule!.groupName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                        color: Colors.grey.shade700,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ]
                                : [
                                    const Text(
                                      "Hora Libre",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blueGrey,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
