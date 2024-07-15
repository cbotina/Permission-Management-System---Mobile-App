import 'package:flutter/material.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/pages/teacher_pages/daily_reports_page.dart';

class DailyReportTile extends StatelessWidget {
  const DailyReportTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.list_alt_rounded,
      title: "Registro de asistencia",
      subtitle: "Llama lista a tus grupos",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const DailyReportsPage();
          },
        ));
      },
    );
  }
}
