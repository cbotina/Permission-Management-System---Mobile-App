import 'package:flutter/material.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/pages/student_pages/student_leaving_permissions_page.dart';
import 'package:pms_app/pages/student_pages/student_permissions_page.dart';

class StudentLeavingPermissionsTile extends StatelessWidget {
  const StudentLeavingPermissionsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.door_sliding_outlined,
      title: "Permisos de salida",
      subtitle: "Justifica tus permisos de salida",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const StudentLeavingPermissionsPage();
          },
        ));
      },
    );
  }
}
