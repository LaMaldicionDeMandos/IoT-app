import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.pink, fontSize: 12),
        textAlign: TextAlign.start);
  }
}
