import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  const Link({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: () {  },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(style: BorderStyle.none), // Color del borde
          padding: const EdgeInsets.all(8), // Sin relleno
        ),
        child: Text(label,
            style: const TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: Colors.pink
            )
        )
    );
  }
}
