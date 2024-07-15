import 'package:flutter/material.dart';
import 'package:pms_app/features/teacher_features/daily_reports/presentation/widgets/components/group_tag_widget.dart';
import 'package:pms_app/features/teacher_features/daily_reports/presentation/widgets/components/time_slot_widget.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/domain/models/schedule_with_daily_report.dart';

class DailyReportsWidget extends StatelessWidget {
  final ScheduleWithDailyReport data;
  final VoidCallback? onTap;
  const DailyReportsWidget({
    super.key,
    required this.data,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(14, 0, 0, 0),
                offset: Offset(1, 1),
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        GroupTagWidget(groupName: data.scheduleView.groupName),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            data.scheduleView.subjectName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    TimeSlotWidget(
                      startTime: data.scheduleView.startTime,
                      endTime: data.scheduleView.endTime,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Checkbox(
                value: data.dailyReportView?.isSubmitted ?? false,
                onChanged: (value) {},
                shape: const CircleBorder(),
                activeColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
