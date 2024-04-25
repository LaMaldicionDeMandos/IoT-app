import 'package:flutter/material.dart';
import 'package:iot_app/components/PasswordTextField.dart';

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
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
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
            Padding(padding: EdgeInsets.symmetric(horizontal: 32, vertical: 56),
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
            )
          ],
        ),
      ),
    );
  }
}
