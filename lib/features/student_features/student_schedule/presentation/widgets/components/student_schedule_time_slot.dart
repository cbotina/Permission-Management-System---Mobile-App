import 'package:flutter/material.dart';
import 'package:pms_app/features/student_features/student_schedule/domain/models/time_slot_with_student_schedule.dart';

class StudentScheduleTimeSlotWidget extends StatelessWidget {
  final TimeSlotWithStudentSchedule data;
  const StudentScheduleTimeSlotWidget({
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
                  color: data.studentSchedule != null
                      ? const Color.fromARGB(255, 240, 255, 242)
                      : const Color.fromARGB(255, 243, 249, 255),
                  child: Row(
                    children: [
                      Container(
                        color: data.studentSchedule != null
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
                            children: data.studentSchedule != null
                                ? [
                                    Text(
                                      data.studentSchedule!.subjectName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      data.studentSchedule!.teacherName,
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
