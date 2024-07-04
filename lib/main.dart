import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pms_app/common/themes/light_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pms_app/features/student_permissions/domain/models/permission.dart';
import 'package:pms_app/pages/justify_absences_page.dart';
import 'package:pms_app/pages/login_page.dart';
import 'package:pms_app/pages/permission_details_page.dart';
import 'package:pms_app/pages/permission_request_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pms_app/pages/profile_page.dart';
import 'package:pms_app/pages/student_permissions_page.dart';
import 'package:pms_app/pages/student_schedule_page.dart';
import 'package:pms_app/pages/student_unjustified_absences_page.dart';

void main() async {
  await dotenv.load();

  Intl.defaultLocale = 'es_ES';
  initializeDateFormatting('es_ES', null).then((_) {
    runApp(const ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
      ],
      theme: lightTheme,
      home: const ProfilePage(),
    );
  }
}
