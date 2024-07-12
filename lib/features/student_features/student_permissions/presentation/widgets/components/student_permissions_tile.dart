import 'package:flutter/material.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/pages/student_pages/student_permissions_page.dart';

class StudentPermissionsTile extends StatelessWidget {
  const StudentPermissionsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.list_rounded,
      title: "Mis Permisos",
      subtitle: "Consulta el estado de tus permisos",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const StudentPermissionsPage();
          },
        ));
      },
    );
  }
}
