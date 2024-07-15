import 'package:flutter/material.dart';

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
