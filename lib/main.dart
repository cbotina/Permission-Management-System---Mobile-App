import 'package:flutter/material.dart';
import 'package:pms_app/common/components/buttons/primary_button.dart';
import 'package:pms_app/common/components/loading/loading_button_indicator.dart';
import 'package:pms_app/common/themes/light_theme.dart';
import 'package:pms_app/pages/main_menu_page.dart';
import 'package:pms_app/pages/permission_request_page.dart';
import 'package:pms_app/pages/student_schedule_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const StudentSchedulePage(),
    );
  }
}
