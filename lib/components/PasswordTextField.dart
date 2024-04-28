import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordTextField({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool visiblePassword = false;
  IconData eyeIcon = Icons.visibility;

  void update() {
    eyeIcon = visiblePassword ? Icons.visibility_off : Icons.visibility;
  }

  void _setVisible(bool visible) {
    setState(() {
      visiblePassword = visible;
      update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: !visiblePassword,
        style: const TextStyle(fontFamily: 'Roboto'),
        decoration: InputDecoration(
            hintText: 'Password',
            suffixIcon: Padding(padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GestureDetector(
                  onTapDown: (details) => setState(() {
                    _setVisible(true);
                  }),
                  onTapCancel: () => setState(() {
                    _setVisible(false);
                  }),
                  child: IconButton(onPressed: () => {}, icon: Icon(eyeIcon)),
                )
            )
        ),
      controller: widget.controller,
    );
  }
}