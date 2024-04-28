import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:iot_app/components/Link.dart';
import 'package:iot_app/components/PasswordTextField.dart';
import 'package:iot_app/components/PrimaryButton.dart';

void main() {
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
      home: const MyHomePage(title: 'Hola! 👋'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _username = '';

  void _setUsername() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 56),
              child: Text(widget.title, style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontFamily: 'Roboto'),
                decoration: InputDecoration(hintText: 'Email')
              )
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: PasswordTextField()
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 32),
              child: Align(
                alignment: Alignment.topRight,
                child: Link(label: 'Recuperar contraseña')
              )
            ),
            const Padding(padding: EdgeInsets.fromLTRB(32, 56, 32, 8),
                child: PrimaryButton(label: 'Login')
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text('O ingresa con',
                style: TextStyle(fontSize: 14, color: Colors.black54))
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: ElevatedButton.icon(onPressed: () {  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      minimumSize: const Size.fromHeight(64),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.centerLeft
                    ),
                    icon: SvgPicture.asset(
                        'assets/images/google_logo.svg',
                      width: 32,
                      height: 32,
                    ),
                    label: const Text('Ingresa con google',
                        style: TextStyle(
                            color: Colors.black
                        )
                    )
                )
            ),
            const Padding(padding: EdgeInsets.fromLTRB(32, 32, 32, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('¿No tienes una cuenta?',
                        style: TextStyle(fontSize: 14, color: Colors.black87)),
                    Link(label: 'Registrate')
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
