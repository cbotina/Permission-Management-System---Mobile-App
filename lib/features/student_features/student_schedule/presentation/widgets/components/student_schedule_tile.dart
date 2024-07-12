import 'package:flutter/material.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/pages/student_pages/student_schedule_page.dart';

class StudentScheduleTile extends StatelessWidget {
  const StudentScheduleTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.timer_sharp,
      title: "Horario de Clases",
      subtitle: "Consulta tu horario de clases 2024-A",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const StudentSchedulePage();
          },
        ));
      },
    );
  }
}
