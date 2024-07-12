import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/common/extensions/async_value_ui.dart';
import 'package:pms_app/features/auth/presentation/controllers/auth_controller.dart';

class LogoutTile extends ConsumerWidget {
  const LogoutTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authControllerProvider);

    ref.listen<AsyncValue<void>>(authControllerProvider, (prev, state) {
      state.dialogOnError(context);
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
