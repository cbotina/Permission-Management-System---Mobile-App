import 'package:flutter/material.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/pages/student_pages/permission_request_page.dart';

class PermissionRequestTile extends StatelessWidget {
  const PermissionRequestTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.edit_calendar_outlined,
      title: "Solicitar Permiso",
      subtitle: "Justifica tus faltas con anticipación",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const PermisssionRequestPage();
          },
        ));
      },
    );
  }
}
