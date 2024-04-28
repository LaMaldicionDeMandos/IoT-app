import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _username = '';

  void _setUsername() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(horizontal: 32, vertical: 56),
              child: Text('Empesemos 👇', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}