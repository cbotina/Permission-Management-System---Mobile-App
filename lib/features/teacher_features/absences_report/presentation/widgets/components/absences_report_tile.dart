import 'package:flutter/material.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/pages/teacher_pages/teacher_subjects_page.dart';

class AbsenceReportTile extends StatelessWidget {
  const AbsenceReportTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.text_snippet_outlined,
      title: "Reporte de faltas",
      subtitle: "Estudiantes con más faltas por unidad de formación",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const TeacherSubjectsPage();
          },
        ));
      },
    );
  }
}
