import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:iot_app/components/ErrorText.dart';
import 'package:iot_app/components/Link.dart';
import 'package:iot_app/components/MyAppBar.dart';
import 'package:iot_app/components/PasswordTextField.dart';
import 'package:iot_app/components/PrimaryButton.dart';
import 'package:iot_app/services/AuthService.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();
  bool hasError = false;

  @override
  void dispose() {
    nameController.dispose();
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
      appBar: MyAppBar.build(context),
      body: Column(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 32, vertical: 56),
                    child: Text('Empecemos 👇', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      child: TextField(
                        style: const TextStyle(fontFamily: 'Roboto'),
                        decoration: const InputDecoration(hintText: 'Nick name'),
                        controller: nameController,
                      )
                  ),
                  if (hasError) const Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.symmetric(horizontal: 40),
                            child: ErrorText("* No hemos encontrado el email."))]),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(fontFamily: 'Roboto'),
                        decoration: const InputDecoration(hintText: 'Email'),
                        controller: usernameController,
                      )
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      child: PasswordTextField(controller: passwordController)
                  ),
                  Padding(padding: const EdgeInsets.fromLTRB(32, 32, 32, 8),
                      child: PrimaryButton(label: 'Registrarme', onPressed: () {
                        _setError(false);
                        String name = nameController.value.text;
                        String username = usernameController.value.text;
                        String password = passwordController.value.text;
                        authService.register(name, username, password)
                            .then((value) => Navigator.pushNamedAndRemoveUntil(context, '/register/code', (Route<dynamic> route) => false,))
                            .catchError((onError) => {_setError(true)});
                      },)
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Text('O registrate con',
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
                          label: const Text('Registrate con google',
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
                          const Text('¿Ya tienes una cuenta?',
                              style: TextStyle(fontSize: 14, color: Colors.black87)),
                          Link(label: 'Login', onPressed: () => Navigator.pushNamed(context, '/login'),)
                        ],
                      )
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}