import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/components/buttons/secondary_button.dart';
import 'package:pms_app/common/components/form_fields/text_form_field.dart';
import 'package:pms_app/common/extensions/async_value_ui.dart';
import 'package:pms_app/features/auth/presentation/widgets/validators/password_validator.dart';
import 'package:pms_app/features/users/data/dto/change_password_dto.dart';
import 'package:pms_app/features/users/presentation/controllers/change_password_controller.dart';

class ChangePasswordIconButton extends StatelessWidget {
  const ChangePasswordIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.edit,
        color: Theme.of(context).colorScheme.primary,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: ChangePasswordForm(),
            );
          },
        );
      },
    );
  }
}

class ChangePasswordForm extends ConsumerStatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangePasswordFormState();
}

class _ChangePasswordFormState extends ConsumerState<ChangePasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _oldPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmNewPasswordController;

  @override
  void initState() {
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmNewPasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Cambiar contraseña",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
            ),
            const SizedBox(height: 30),
            OutlinedTextFormField(
              label: "Contraseña actual",
              controller: _oldPasswordController,
              obscureText: true,
              maxLines: 1,
              validator: passwordValidator,
            ),
            const SizedBox(height: 15),
            OutlinedTextFormField(
              label: "Nueva contraseña",
              controller: _newPasswordController,
              obscureText: true,
              maxLines: 1,
              validator: passwordValidator,
            ),
            const SizedBox(height: 15),
            OutlinedTextFormField(
              label: "Confirmar nueva contraseña",
              controller: _confirmNewPasswordController,
              obscureText: true,
              maxLines: 1,
              validator: (confirmation) {
                if (confirmation == '') return "Este campo es requerido";
                if (confirmation != _newPasswordController.text) {
                  return "Las contraseñas deben coincidir";
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondaryButton(
                  onTap: Navigator.of(context).pop,
                  minWidth: 100,
                  child: Text(
                    "Cancelar",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                ChangePasswordButton(
                  formKey: _formKey,
                  oldPasswordController: _oldPasswordController,
                  newPasswordController: _newPasswordController,
                  confirmNewPasswordController: _confirmNewPasswordController,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChangePasswordButton extends ConsumerWidget {
  final TextEditingController _oldPasswordController;
  final TextEditingController _newPasswordController;
  final TextEditingController _confirmNewPasswordController;
  final GlobalKey<FormState> _formKey;

  const ChangePasswordButton(
      {super.key,
      required TextEditingController oldPasswordController,
      required TextEditingController newPasswordController,
      required TextEditingController confirmNewPasswordController,
      required GlobalKey<FormState> formKey})
      : _oldPasswordController = oldPasswordController,
        _newPasswordController = newPasswordController,
        _confirmNewPasswordController = confirmNewPasswordController,
        _formKey = formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(changePasswordControllerProvider);

    ref.listen<AsyncValue<void>>(changePasswordControllerProvider,
        (prev, state) {
      state.showSnackbarOnError(context);
      state.dialogOnSuccess(
        prev,
        'Su contraseña ha sido cambiada con éxito',
        context,
      );
    });

    return PrimaryButton(
      isLoading: state.isLoading,
      enabled: !state.isLoading,
      minWidth: 100,
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          final dto = ChangePasswordDto(
            oldPassword: _oldPasswordController.text,
            newPassword: _newPasswordController.text,
          );

          await ref
              .read(changePasswordControllerProvider.notifier)
              .changePassword(dto);
        }
      },
      child: Text(
        "Aceptar",
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
