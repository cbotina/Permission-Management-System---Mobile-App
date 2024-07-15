import 'package:flutter/material.dart';
import 'package:pms_app/features/auth/presentation/widgets/components/buttons/logout_tile.dart';
import 'package:pms_app/features/teacher_features/absences_report/presentation/widgets/components/absences_report_tile.dart';
import 'package:pms_app/features/teacher_features/daily_reports/presentation/widgets/components/daily_report_tile.dart';
import 'package:pms_app/features/teacher_features/teacher_profile/presentation/widgets/components/teacher_profile_tile.dart';
import 'package:pms_app/features/teacher_features/teacher_schedule/presentation/widgets/components/teacher_schedule_page.dart';

class TeacherMainMenuPage extends StatelessWidget {
  const TeacherMainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú Principal"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          DailyReportTile(),
          AbsenceReportTile(),
          TeacherScheduleTile(),
          TeacherProfileTile(),
          LogoutTile(),
        ],
      ),
    );
  }
}
