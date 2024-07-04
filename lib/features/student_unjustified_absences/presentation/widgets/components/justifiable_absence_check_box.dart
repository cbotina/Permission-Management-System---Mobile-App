import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pms_app/features/student_unjustified_absences/data/providers/seleted_justified_absences_provider.dart';
import 'package:pms_app/features/student_unjustified_absences/domain/models/unjustified_absence_details_view.dart';

class JustifiableAbsencesCheckBox extends ConsumerStatefulWidget {
  final UnjustifiedAbsenceDetailsView absence;

  const JustifiableAbsencesCheckBox({
    super.key,
    required this.absence,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _JustifiableAbsencesCheckBoxState();
}

class _JustifiableAbsencesCheckBoxState
    extends ConsumerState<JustifiableAbsencesCheckBox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 213, 232, 240),
                borderRadius: BorderRadius.circular(5),
              ),
              width: 130,
              child: Text(
                '${DateFormat.yMMMEd().format(widget.absence.absenceDate).toUpperCase()}\n${widget.absence.startTime.format(context).padLeft(8, '0').substring(0, 5)} -  ${widget.absence.endTime.format(context).padLeft(8, '0')}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.absence.subjectName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Checkbox(
              value: isSelected,
              activeColor: Theme.of(context).colorScheme.primary,
              onChanged: (value) {
                setState(() {
                  isSelected = value ?? false;
                });

                if (value == false) {
                  ref
                      .read(selectedJustifiableAbsencesIdsProvider.notifier)
                      .remove(widget.absence.absenceId);
                } else {
                  ref
                      .read(selectedJustifiableAbsencesIdsProvider.notifier)
                      .add(widget.absence.absenceId);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
