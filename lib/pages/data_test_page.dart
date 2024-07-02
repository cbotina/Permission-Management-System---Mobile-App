import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/features/student_schedule/data/providers/student_schedule_provider.dart';

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
