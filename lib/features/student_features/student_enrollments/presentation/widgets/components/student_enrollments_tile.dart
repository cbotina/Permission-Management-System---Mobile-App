import 'package:flutter/material.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/pages/student_pages/student_enrollments_page.dart';

class StudentEnrollmentsTile extends StatelessWidget {
  const StudentEnrollmentsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.school,
      title: "Mis Inscripciones",
      subtitle: "Consulta tus materias inscritas",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const StudentEnrollmentsPage();
          },
        ));
      },
    );
  }
}
