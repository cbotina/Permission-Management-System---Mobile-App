import 'package:flutter/material.dart';
import 'package:pms_app/features/student_features/student_enrollments/domain/models/student_enrollment_view.dart';

class StudentEnrollmentTile extends StatelessWidget {
  final StudentEnrollmentView enrollment;
  final VoidCallback? onTap;

  const StudentEnrollmentTile({
    super.key,
    required this.enrollment,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(
            Icons.school,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        title: Text(
          enrollment.subjectName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Prof. ${enrollment.teacherName}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Theme.of(context).colorScheme.surfaceTint,
          size: 16,
        ),
      ),
    );
  }
}
