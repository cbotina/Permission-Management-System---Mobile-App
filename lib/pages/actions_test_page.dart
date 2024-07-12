import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/extensions/async_value_ui.dart';
import 'package:pms_app/features/teacher_features/daily_reports/data/dto/create_daily_report_dto.dart';
import 'package:pms_app/features/teacher_features/daily_reports/presentation/controllers/create_daily_report_controller.dart';

class ActionTestPage extends ConsumerWidget {
  const ActionTestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state =
        ref.watch(createDailyReportControllerProvider);

    ref.listen<AsyncValue<void>>(createDailyReportControllerProvider,
        (prev, state) {
      state.dialogOnError(context);
      state.dialogOnSuccess(prev, 'siu', context);
      // state.popOnSuccess(
      //   prev,
      //   "Operacion exitosa",
      //   context,
      // );
    });
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: PrimaryButton(
            isLoading: state.isLoading,
            enabled: !state.isLoading,
            onTap: () async {
              final date = DateTime(2024, 1, 2);

              final dto = CreateDailyReportDto(
                reportDate: date,
                isSubmitted: true,
                subjectGroupTimeSlotId: 182,
                studentsAbsences: [
                  StudentAbsence(studentId: 114),
                  StudentAbsence(studentId: 120),
                  StudentAbsence(studentId: 123),
                ],
              );

              await ref
                  .read(createDailyReportControllerProvider.notifier)
                  .createDailyReport(dto);

              // await ref
              //     .read(justifyAbsencesControllerProvider.notifier)
              //     .justifyAbsences(1, dto);
            },
            minWidth: 80,
            child: const Text(
              "Crear",
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
