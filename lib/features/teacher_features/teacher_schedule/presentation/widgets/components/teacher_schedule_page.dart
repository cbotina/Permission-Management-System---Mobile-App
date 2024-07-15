import 'package:flutter/material.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/pages/teacher_pages/teacher_schedule_page.dart';

class TeacherScheduleTile extends StatelessWidget {
  const TeacherScheduleTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.timer_sharp,
      title: "Horario de Clases",
      subtitle: "Consulta tu horario de clases",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const TeacherSchedulePage();
          },
        ));
      },
    );
  }
}
