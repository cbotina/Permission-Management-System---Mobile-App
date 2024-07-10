import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/secondary_button.dart';
import 'package:pms_app/features/student_features/permission_requests/data/providers/selected_absence_time_slots_provider.dart';

class SelectTimeSlotsButton extends ConsumerWidget {
  final void Function(DateTimeRange newTimeRange) setRange;
  const SelectTimeSlotsButton({super.key, required this.setRange});

  @override
  Widget build(BuildContext context, ref) {
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
        final DateTimeRange? dateTimeRange = await showDateRangePicker(
          context: context,
          firstDate: DateTime.now().add(const Duration(days: 1)),
          lastDate: DateTime(2024, 12, 30), // todo: active period end time
          locale: const Locale('es', "ES"),
          initialEntryMode: DatePickerEntryMode.calendarOnly,
        );
        if (dateTimeRange != null) {
          ref.invalidate(selectedAbsenceTimeSlotsProvider);
          setRange(dateTimeRange);
        }
      },
    );
  }
}
