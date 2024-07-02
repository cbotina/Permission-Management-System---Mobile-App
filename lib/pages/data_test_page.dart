import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/providers/repository_providers.dart';
import 'package:pms_app/features/permission_requests/data/dto/schedule_range_dates_dto.dart';
import 'package:pms_app/features/permission_requests/data/providers/day_time_slots_provider.dart';
import 'package:pms_app/features/student_permissions/data/providers/permission_absences_repository_provider.dart';
import 'package:pms_app/features/student_permissions/data/providers/student_period_permissions_provider.dart';
import 'package:pms_app/features/student_profile/data/providers/student_info_provider.dart';
import 'package:pms_app/features/student_schedule/data/providers/student_schedule_provider.dart';
import 'package:pms_app/features/student_unjustified_absences/data/providers/unjustified_absences_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final dto = ScheduleRangeDatesDto(
    //     startDate: DateTime(2024, 6, 25), endDate: DateTime(2024, 6, 28));

    final timeslots = ref.watch(studentScheduleProvider('THU'));
    // final student = ref.watch(studentInfoProvider(1));
    return Scaffold(
      body: Center(
        child: timeslots.when(
          data: (data) {
            // return Text(data.toString());
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data.elementAt(index).toString()),
                  subtitle: Text(index.toString()),
                );
              },
            );
            // return ListView.builder(
            //   itemCount: data.items.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(data.items.elementAt(index).toString()),
            //       subtitle: Text(index.toString()),
            //     );
            //   },
            // );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
