import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pingme/config/theme/app_theme.dart';
import 'package:pingme/data/services/service_locator.dart';
import 'package:pingme/firebase_options.dart';
import 'package:pingme/presentation/screens/auth/login_screen.dart';
import 'package:pingme/router/app_router.dart';

void main() async {
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PingMe',
      navigatorKey: getIt<AppRouter>().navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: LoginScreen(),
    );
  }
}




// flutter run -d 00008030-0010044C0120C02Ex