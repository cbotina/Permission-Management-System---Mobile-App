import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/extensions/async_value_ui.dart';
import 'package:pms_app/features/users/data/dto/change_password_dto.dart';
import 'package:pms_app/features/users/presentation/controllers/change_password_controller.dart';

class ActionTestPage extends ConsumerWidget {
  const ActionTestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(changePasswordControllerProvider);

    ref.listen<AsyncValue<void>>(changePasswordControllerProvider,
        (prev, state) {
      state.showSnackbarOnError(context);
      // state.popOnSuccess(
      //   prev,
      //   "Operacion exitosa",
      //   context,
      // );
    });
    return Scaffold(
      body: PrimaryButton(
        isLoading: state.isLoading,
        enabled: !state.isLoading,
        onTap: () async {
          final dto = ChangePasswordDto(
            oldPassword: 'Student1234!',
            newPassword: 'Hello1234!',
          );

          await ref
              .read(changePasswordControllerProvider.notifier)
              .changePassword(2, dto);
        },
        minWidth: 80,
        child: const Text(
          "Crear",
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
