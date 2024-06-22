import 'package:flutter/material.dart';
import 'package:iot_app/components/Link.dart';
import 'package:iot_app/components/SixDigitCode.dart';
import 'package:iot_app/services/AuthService.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Text('Ingresa el código de verificación 🔒', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text('Se ha enviado un código de verificación de 6 dígitos a tu dirección de correo electrónico.',
                    style: TextStyle(fontSize: 14, color: Colors.black54))
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
              child: SixDigitCode(listener: (code) => {
                authService.sendValidationCode(code)
                .then((isOk) => {
                  if (isOk) Navigator.pushNamedAndRemoveUntil(context, '/login', (Route<dynamic> route) => false,)
                })
              }),
            ),
          ]
        ),
      ),
      bottomNavigationBar: Padding(padding: const EdgeInsets.all(32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text('¿No has recibido el código?',
          style: TextStyle(fontSize: 14, color: Colors.black87)),
          Link(label: 'Re enviar', onPressed: () => {})
          ],
        )
      )
    );
  }
}