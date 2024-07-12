import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pms_app/common/themes/light_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pms_app/pages/actions_test_page.dart';
import 'package:pms_app/pages/teacher_pages/absence_count_page.dart';
import 'package:pms_app/pages/teacher_pages/daily_reports_page.dart';
import 'package:pms_app/pages/teacher_pages/make_daily_report_page.dart';
import 'package:pms_app/pages/teacher_pages/teacher_main_menu_page.dart';
import 'package:pms_app/pages/teacher_pages/teacher_profile_page.dart';
import 'package:pms_app/pages/teacher_pages/teacher_schedule_page.dart';
import 'package:pms_app/pages/teacher_pages/teacher_subjects_page.dart';
import 'firebase_options.dart';

void main() async {
  await dotenv.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        home: const TeacherProfilePage()
        // home: Consumer(
        //   builder: (context, ref, child) {
        //     final isLoggedIn = ref.watch(isLoggedInProvider);
        //     return isLoggedIn ? const MainMenuPage() : const LoginPage();
        //   },
        // ),
        );
  }
}
