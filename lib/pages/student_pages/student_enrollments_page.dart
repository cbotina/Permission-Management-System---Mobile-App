import 'package:flutter/material.dart';
import 'package:pms_app/features/student_features/student_enrollments/presentation/widgets/student_enrollments_widget.dart';

class StudentEnrollmentsPage extends StatelessWidget {
  const StudentEnrollmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Inscripciones"),
      ),
      body: const StudentEnrollmentsWidget(),
    );
  }
}
