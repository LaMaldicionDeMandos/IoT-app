
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iot_app/components/ErrorText.dart';

import 'package:iot_app/components/Link.dart';
import 'package:iot_app/components/PasswordTextField.dart';
import 'package:iot_app/components/PrimaryButton.dart';
import 'package:iot_app/services/AuthService.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();
  bool hasError = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void _setError(bool e) {
    setState(() {
      hasError = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.symmetric(horizontal: 32, vertical: 56),
              child: Text('Hola! 👋', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontFamily: 'Roboto'),
                    decoration: const InputDecoration(hintText: 'Email'),
                    controller: usernameController,
                )
            ),
            if (hasError) const Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ErrorText("* No hemos encontrado el email."))]),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: PasswordTextField(controller: passwordController)
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Link(label: 'Recuperar contraseña', onPressed: () {},)
                )
            ),
            Padding(padding: const EdgeInsets.fromLTRB(32, 56, 32, 8),
                child: PrimaryButton(label: 'Login', onPressed: () {
                  _setError(false);
                  String username = usernameController.value.text;
                  String password = passwordController.value.text;
                  authService.login(username, password)
                  .then((value) => Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false,))
                      .catchError((onError) => {_setError(true)});
                },)
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
            Padding(padding: const EdgeInsets.fromLTRB(32, 32, 32, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('¿No tienes una cuenta?',
                        style: TextStyle(fontSize: 14, color: Colors.black87)),
                    Link(label: 'Registrate', onPressed: () => Navigator.pushNamed(context, '/register'),)
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}