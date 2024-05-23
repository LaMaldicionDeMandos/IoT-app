import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Text('Ingresa el codigo de verificación 🔒', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text('Se ha enviado un código de verificación de 6 dígitos a tu dirección de correo electrónico.',
                    style: TextStyle(fontSize: 14, color: Colors.black54))
            ),
          ],
        ),
      ),
    );
  }
}