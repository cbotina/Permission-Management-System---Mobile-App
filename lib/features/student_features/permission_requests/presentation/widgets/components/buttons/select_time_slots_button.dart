import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/components/buttons/secondary_button.dart';
import 'package:pms_app/features/session/data/providers/active_period_id_provider.dart';
import 'package:pms_app/features/session/data/providers/active_period_provider.dart';
import 'package:pms_app/features/student_features/permission_requests/data/providers/day_time_slots_provider.dart';
import 'package:pms_app/features/student_features/permission_requests/data/providers/selected_absence_time_slots_provider.dart';

class SelectTimeSlotsButton extends ConsumerWidget {
  final void Function(DateTimeRange newTimeRange) setRange;
  const SelectTimeSlotsButton({super.key, required this.setRange});

  @override
  Widget build(BuildContext context, ref) {
    final endDate = ref.watch(activePeriodProvider)!.endDate;

    return SecondaryButton(
      minWidth: 150,
      child: Row(
        children: [
          Icon(
            Icons.calendar_month_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 10),
          Text(
            "Seleccionar Fechas",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      onTap: () async {
        ref.read(selectedAbsenceTimeSlotsProvider.notifier).reset();

        final DateTimeRange? dateTimeRange = await showDateRangePicker(
          context: context,
          firstDate: DateTime.now().add(const Duration(days: 1)),
          lastDate: endDate,
          locale: const Locale('es', "ES"),
          initialEntryMode: DatePickerEntryMode.calendarOnly,
        );

        if (dateTimeRange != null) {
          if (dateTimeRange.duration.inDays >= 15) {
            if (context.mounted) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: const Text(
                        "Ha seleccionado demasiados días. El límite es 15"),
                    actions: [
                      PrimaryButton(
                        child: const Text(
                          "Entendido",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
              return;
            }
          }

          ref.invalidate(dayTimeSlotsProvider);
          ref.invalidate(selectedAbsenceTimeSlotsProvider);
          setRange(dateTimeRange);
        }
      },
    );
  }
}
