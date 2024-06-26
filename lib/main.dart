
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:iot_app/pages/VerificationCodePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:iot_app/pages/MainPage.dart';
import 'package:iot_app/pages/LoginPage.dart';
import 'package:iot_app/pages/RegisterPage.dart';

String initScreen = '/login';
void main() async {
  await dotenv.load(fileName: ".env");
  final preferences = await SharedPreferences.getInstance();
  initScreen = preferences.containsKey('accessToken') ? '/' : '/login';
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoT Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
          backgroundColor: Colors.white
        ),

        primaryColor: Colors.pink,
        textSelectionTheme: const TextSelectionThemeData(
         cursorColor: Colors.pink
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xfff1f1f1),

          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none

          )
        ),
        fontFamily: 'Lato',
         //colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: initScreen,
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => const MainPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/register': (BuildContext context) => const RegisterPage(),
        '/register/code': (BuildContext context) => const VerificationCodePage()
      },
    );
  }
}