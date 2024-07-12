import 'package:flutter/material.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/pages/student_pages/student_unjustified_absences_page.dart';

class StudentAbsencesTile extends StatelessWidget {
  const StudentAbsencesTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.cancel_outlined,
      title: "Registro de Faltas",
      subtitle: "Revisa si tienes faltas por justificar",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const StudentUnjustifiedAbsencesPage();
          },
        ));
      },
    );
  }
}
