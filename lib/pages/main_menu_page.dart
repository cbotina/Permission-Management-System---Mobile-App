import 'package:flutter/material.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/features/permission_requests/presentation/widgets/permission_request_tile.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú Principal"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const PermissionRequestTile(),
            Tile(
              iconData: Icons.list_rounded,
              title: "Mis Permisos",
              subtitle: "Consulta el estado de tus permisos",
              onTap: () {},
            ),
            Tile(
              iconData: Icons.timer_sharp,
              title: "Horario de Clases",
              subtitle: "Consulta tu horario de clases 2024-A",
              onTap: () {},
            ),
            Tile(
              iconData: Icons.cancel_outlined,
              title: "Registro de Faltas",
              subtitle: "Revisa si tienes faltas por justificar",
              onTap: () {},
            ),
            Tile(
              iconData: Icons.person_outlined,
              title: "Mi Perfil",
              subtitle: "Cambiar foto, cambiar contraseña",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
