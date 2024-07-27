import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_app/common/errors/error_widget.dart';
import 'package:pms_app/common/extensions/capitalize.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/common/providers/today_provider.dart';
import 'package:pms_app/features/teacher_features/daily_reports/presentation/widgets/components/daily_reports_check_box.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/data/providers/schedule_with_daily_reports_provider.dart';
import 'package:pms_app/pages/teacher_pages/make_daily_report_page.dart';

class DailyReportsPage extends ConsumerWidget {
  const DailyReportsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final today = ref.watch(todayProvider);
    ref.invalidate(teacherDailyReportsRepositoryProvider);
    ref.invalidate(scheduleWithDailyReportsProvider);

    log('building');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registros de asistencia"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(teacherDailyReportsRepositoryProvider);
          ref.invalidate(scheduleWithDailyReportsProvider);
        },
        child: ListView(
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
                      children: data.map((e) {
                        final isSubmitted =
                            e.dailyReportView?.isSubmitted ?? false;

                        return DailyReportsWidget(
                          data: e,
                          onTap: isSubmitted
                              ? null
                              : () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return MakeDailyReportPage(data: e);
                                      },
                                    ),
                                  );
                                },
                        );
                      }).toList(),
                    );
                  },
                  error: (error, stackTrace) => ErrorWidgetUI(onRefresh: () {
                    ref.invalidate(teacherDailyReportsRepositoryProvider);

                    ref.invalidate(scheduleWithDailyReportsProvider);
                  }),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
