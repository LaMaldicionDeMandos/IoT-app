import 'package:flutter/material.dart';

class MyAppBar {
  static AppBar build(BuildContext context) {
    return AppBar(
      leadingWidth: 64,
      toolbarHeight: 64,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: OutlinedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
            side: MaterialStateProperty.all(const BorderSide(color: Colors.grey, width: 2.0)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
      ),
    );
  }
}
