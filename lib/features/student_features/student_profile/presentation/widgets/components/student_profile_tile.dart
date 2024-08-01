import 'package:flutter/material.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/pages/student_pages/student_profile_page.dart';

class StudentProfileTile extends StatelessWidget {
  const StudentProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.person_outlined,
      title: "Mi Perfil",
      subtitle: "Consultar datos, cambiar contraseña",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const StudentProfile();
          },
        ));
      },
    );
  }
}
