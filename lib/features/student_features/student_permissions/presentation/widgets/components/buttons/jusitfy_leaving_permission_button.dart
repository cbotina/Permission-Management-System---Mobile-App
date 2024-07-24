import 'package:flutter/material.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/features/student_features/student_permissions/presentation/widgets/components/justify_leaving_permission_form.dart';

class JusitfyLeavingPermissionButton extends StatelessWidget {
  const JusitfyLeavingPermissionButton({
    super.key,
    required this.permissionId,
    required this.enabled,
  });
  final int permissionId;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        enabled: enabled,
        child: const Text(
          "Justificar",
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: JustifyLeavingPermissionForm(
                  permissionId: permissionId,
                ),
              );
            },
          );
        });
  }
}
