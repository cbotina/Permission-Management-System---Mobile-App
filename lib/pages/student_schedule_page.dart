import 'package:flutter/material.dart';

class StudentSchedulePage extends StatelessWidget {
  const StudentSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Horario"),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilledButton(onPressed: () {}, child: const Text("Hello")),
                FilledButton(onPressed: () {}, child: const Text("Hello")),
                FilledButton(onPressed: () {}, child: const Text("Hello")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
