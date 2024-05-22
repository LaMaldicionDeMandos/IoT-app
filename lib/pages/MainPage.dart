import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(horizontal: 32, vertical: 56),
              child: Text('Empecemos 👇', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}