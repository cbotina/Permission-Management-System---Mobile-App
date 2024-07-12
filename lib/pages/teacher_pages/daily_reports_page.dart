import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_app/common/extensions/capitalize.dart';
import 'package:pms_app/features/teacher_features/daily_reports/domain/models/teacher_daily_report_view.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/data/providers/schedule_with_daily_reports_provider.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/domain/models/schedule_with_daily_report.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/domain/models/teacher_schedule_view.dart';

class DailyReportsPage extends StatelessWidget {
  DailyReportsPage({super.key});
  final today = DateTime(2024, 7, 10);

  @override
  Widget build(BuildContext context) {
    log('building');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registros de asistencia"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Text(DateFormat.yMMMMEEEEd().format(today).capitalize()),
          Consumer(
            builder: (context, ref, child) {
              final dailyReports =
                  ref.watch(scheduleWithDailyReportsProvider(today));

              return dailyReports.when(
                data: (data) {
                  return Column(
                    children: data
                        .map(
                          (e) => DailyReportsWidget(data: e),
                        )
                        .toList(),
                  );
                },
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DailyReportsWidget extends StatelessWidget {
  final ScheduleWithDailyReport data;
  const DailyReportsWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
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
    );
  }
}

class TimeSlotWidget extends StatelessWidget {
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  const TimeSlotWidget({
    super.key,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer_outlined,
          color: Colors.grey.shade800,
          size: 16,
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            '${startTime.format(context).padLeft(8, '0')} - ${endTime.format(context).padLeft(8, '0')}',
            style: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class GroupTagWidget extends StatelessWidget {
  final String groupName;
  const GroupTagWidget({
    super.key,
    required this.groupName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 6,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 202, 243, 255),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.people,
            size: 18,
          ),
          const SizedBox(width: 5),
          Text(
            groupName,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
