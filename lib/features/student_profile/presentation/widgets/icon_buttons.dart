import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/components/buttons/secondary_button.dart';
import 'package:pms_app/common/components/form_fields/text_form_field.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Cambiar contraseña",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
          ),
          const SizedBox(height: 30),
          const OutlinedTextFormField(
            label: "Contraseña actual",
            obscureText: true,
            maxLines: 1,
          ),
          const SizedBox(height: 15),
          const OutlinedTextFormField(
            label: "Nueva contraseña",
            obscureText: true,
            maxLines: 1,
          ),
          const SizedBox(height: 15),
          const OutlinedTextFormField(
            label: "Confirmar nueva contraseña",
            obscureText: true,
            maxLines: 1,
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
              const ChangePasswordButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class ChangePasswordButton extends ConsumerWidget {
  const ChangePasswordButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(
      minWidth: 100,
      onTap: () {},
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
