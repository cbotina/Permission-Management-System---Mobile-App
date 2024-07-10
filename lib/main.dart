import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pms_app/common/themes/light_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pms_app/features/auth/data/providers/is_logged_in.dart';
import 'package:pms_app/pages/actions_test_page.dart';
import 'package:pms_app/pages/data_test_page.dart';
import 'package:pms_app/pages/login_page.dart';
import 'package:pms_app/pages/main_menu_page.dart';
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
        home: const ActionTestPage()
        // home: Consumer(
        //   builder: (context, ref, child) {
        //     final isLoggedIn = ref.watch(isLoggedInProvider);
        //     return isLoggedIn ? const MainMenuPage() : const LoginPage();
        //   },
        // ),
        );
  }
}
