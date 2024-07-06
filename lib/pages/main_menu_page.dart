import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/common/extensions/async_value_ui.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';
import 'package:pms_app/features/permission_requests/presentation/widgets/permission_request_tile.dart';
import 'package:pms_app/pages/profile_page.dart';
import 'package:pms_app/pages/student_permissions_page.dart';
import 'package:pms_app/pages/student_schedule_page.dart';
import 'package:pms_app/pages/student_unjustified_absences_page.dart';

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
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const StudentPermissionsPage();
                  },
                ));
              },
            ),
            Tile(
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
            ),
            Tile(
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
            ),
            Tile(
              iconData: Icons.person_outlined,
              title: "Mi Perfil",
              subtitle: "Cambiar foto, cambiar contraseña",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const ProfilePage();
                  },
                ));
              },
            ),
            const LogoutTileButton(),
          ],
        ),
      ),
    );
  }
}

class LogoutTileButton extends ConsumerWidget {
  const LogoutTileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authControllerProvider);

    ref.listen<AsyncValue<void>>(authControllerProvider, (prev, state) {
      state.showSnackbarOnError(context);
    });

    return Tile(
      iconData: Icons.logout,
      title: "Cerrar sesion",
      subtitle: "Hasta pronto!",
      onTap: () async {
        await ref.read(authControllerProvider.notifier).logout();
      },
    );
  }
}
