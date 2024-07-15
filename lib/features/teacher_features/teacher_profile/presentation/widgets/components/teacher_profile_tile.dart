import 'package:flutter/material.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/pages/teacher_pages/teacher_profile_page.dart';

class TeacherProfileTile extends StatelessWidget {
  const TeacherProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.timer_sharp,
      title: "Mi perfil",
      subtitle: "Cambia tu contraseña",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const TeacherProfilePage();
          },
        ));
      },
    );
  }
}
