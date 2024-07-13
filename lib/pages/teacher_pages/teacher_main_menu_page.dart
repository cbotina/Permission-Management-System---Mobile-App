import 'package:flutter/material.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/features/auth/presentation/widgets/components/buttons/logout_tile.dart';
import 'package:pms_app/pages/student_pages/student_schedule_page.dart';
import 'package:pms_app/pages/teacher_pages/absence_count_page.dart';
import 'package:pms_app/pages/teacher_pages/daily_reports_page.dart';
import 'package:pms_app/pages/teacher_pages/teacher_profile_page.dart';
import 'package:pms_app/pages/teacher_pages/teacher_schedule_page.dart';
import 'package:pms_app/pages/teacher_pages/teacher_subjects_page.dart';

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

class TeacherProfileTile extends StatelessWidget {
  const TeacherProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.timer_sharp,
      title: "Mi perfil",
      subtitle: "Cambia tu contraseña",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const TeacherProfilePage();
          },
        ));
      },
    );
  }
}

class TeacherScheduleTile extends StatelessWidget {
  const TeacherScheduleTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.timer_sharp,
      title: "Horario de Clases",
      subtitle: "Consulta tu horario de clases",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const TeacherSchedulePage();
          },
        ));
      },
    );
  }
}

class AbsenceReportTile extends StatelessWidget {
  const AbsenceReportTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tile(
      iconData: Icons.text_snippet_outlined,
      title: "Reporte de faltas",
      subtitle: "Estudiantes con más faltas por unidad de formación",
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const TeacherSubjectsPage();
          },
        ));
      },
    );
  }
}

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
