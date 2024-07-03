import 'package:flutter/material.dart';
import 'package:pms_app/features/student_permissions/domain/models/permission.dart';

class PermissionStatusWidget extends StatelessWidget {
  final PermissionStatus status;
  const PermissionStatusWidget({
    super.key,
    required this.status,
  });

  Color getColor(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.pending:
        return Colors.amber;
      case PermissionStatus.leavePermission:
        return Colors.blue;
      case PermissionStatus.approved:
        return Colors.green;
      case PermissionStatus.rejected:
        return Colors.pink;
    }
  }

  String getText(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.pending:
        return 'Pendiente';
      case PermissionStatus.leavePermission:
        return 'Salida';
      case PermissionStatus.approved:
        return 'Aprobado';
      case PermissionStatus.rejected:
        return 'Rechazado';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: getColor(status), width: 1),
        color: getColor(status).withOpacity(.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        getText(status),
        textAlign: TextAlign.center,
      ),
    );
  }
}
