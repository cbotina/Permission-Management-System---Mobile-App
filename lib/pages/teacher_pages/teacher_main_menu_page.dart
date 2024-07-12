import 'package:flutter/material.dart';
import 'package:pms_app/common/components/tile.dart';
import 'package:pms_app/pages/student_pages/student_schedule_page.dart';

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
        children: [
          Tile(
            iconData: Icons.list_alt_rounded,
            title: "Registro de asistencia",
            subtitle: "Llama lista a tus grupos",
            onTap: () {},
          ),
          Tile(
            iconData: Icons.text_snippet_outlined,
            title: "Reporte de faltas",
            subtitle: "Estudiantes con más faltas por unidad de formación",
            onTap: () {},
          ),
          Tile(
            iconData: Icons.timer_sharp,
            title: "Horario de Clases",
            subtitle: "Consulta tu horario de clases",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
