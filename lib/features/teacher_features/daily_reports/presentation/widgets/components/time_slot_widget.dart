import 'package:flutter/material.dart';

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
