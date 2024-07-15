import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/features/student_features/permission_requests/data/providers/selected_absence_time_slots_provider.dart';
import 'package:pms_app/pages/student_pages/permission_request_page.dart';

class PermissionRequestTile extends ConsumerWidget {
  const PermissionRequestTile({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Tile(
      iconData: Icons.edit_calendar_outlined,
      title: "Solicitar Permiso",
      subtitle: "Justifica tus faltas con anticipación",
      onTap: () {
        ref.read(selectedAbsenceTimeSlotsProvider.notifier).reset();

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const PermisssionRequestPage();
          },
        ));
      },
    );
  }
}
