import 'package:flutter/material.dart';
import 'package:pms_app/features/auth/presentation/widgets/components/buttons/logout_tile.dart';
import 'package:pms_app/features/student_features/permission_requests/presentation/widgets/permission_request_tile.dart';
import 'package:pms_app/features/student_features/student_permissions/presentation/widgets/components/student_leaving_permissions_tile.dart';
import 'package:pms_app/features/student_features/student_permissions/presentation/widgets/components/student_permissions_tile.dart';
import 'package:pms_app/features/student_features/student_profile/presentation/widgets/components/student_profile_tile.dart';
import 'package:pms_app/features/student_features/student_schedule/presentation/widgets/components/student_schedule_tile.dart';
import 'package:pms_app/features/student_features/student_unjustified_absences/presentation/widgets/components/student_unjustified_absences_tile.dart';
import 'package:pms_app/pages/student_pages/student_leaving_permissions_page.dart';

class StudentMainMenuPage extends StatelessWidget {
  const StudentMainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú Principal"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          PermissionRequestTile(),
          StudentPermissionsTile(),
          StudentLeavingPermissionsTile(),
          StudentScheduleTile(),
          StudentAbsencesTile(),
          StudentProfileTile(),
          LogoutTile(),
        ],
      ),
    );
  }
}
