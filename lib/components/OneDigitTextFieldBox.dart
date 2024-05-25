import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OneDigitTextFieldBox extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const OneDigitTextFieldBox({super.key, required this.controller, required this.focusNode});

  @override
  State<StatefulWidget> createState() => _OneDigitTextFieldBoxState();
}

class _OneDigitTextFieldBoxState extends State<OneDigitTextFieldBox> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 2),
          child:TextField(
          focusNode: widget.focusNode,
          controller: widget.controller,
          style: const TextStyle(fontFamily: 'Roboto', fontSize: 20),
          decoration: const InputDecoration(),
          keyboardType: const TextInputType.numberWithOptions(),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly, // Permite solo dígitos
            LengthLimitingTextInputFormatter(1), // Limita a un solo carácter
          ],
        )));
  }
}