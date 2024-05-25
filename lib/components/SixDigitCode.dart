import 'package:flutter/material.dart';
import 'package:iot_app/components/OneDigitTextFieldBox.dart';

class SixDigitCode extends StatefulWidget {
  static void defaultListener(String a) {

  }
  final Function(String) listener;
  const SixDigitCode({super.key, this.listener = defaultListener});

  @override
  State<StatefulWidget> createState() => _SixDigitCodeState();
}

class _SixDigitCodeState extends State<SixDigitCode> {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  List<FocusNode> focuses = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  List<String> digits = ["", "", "", "", "", ""];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      var listener = curry(control)(i);
      controllers[i].addListener(listener);
    }
  }

  Function curry(Function(int) func) {
    return (int a) {
      return () {
        return func(a);
      };
    };
  }

  void control(int index) {
    _setDigit(index, controllers[index].text);
  }

  void _setDigit(int index, String digit) {
    setState(() {
      digits[index] = digit;
      if(digit.isNotEmpty) {
        if (index < 5) FocusScope.of(context).requestFocus(focuses[index + 1]);
      }
      else {
        if (index > 0) FocusScope.of(context).requestFocus(focuses[index - 1]);
      }

      if (completeDigits()) {
        widget.listener(digits.reduce((value, digit) => value + digit));
      }
    });
  }

  bool completeDigits() {
    return digits.every((digit) => digit.isNotEmpty);
  }

  @override
  void dispose() {
    controllers.forEach((controller) => controller.dispose());
    focuses.forEach((focus) => focus.dispose());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OneDigitTextFieldBox(controller: controllers[0], focusNode:  focuses[0]),
        OneDigitTextFieldBox(controller: controllers[1], focusNode:  focuses[1]),
        OneDigitTextFieldBox(controller: controllers[2], focusNode:  focuses[2]),
        OneDigitTextFieldBox(controller: controllers[3], focusNode:  focuses[3]),
        OneDigitTextFieldBox(controller: controllers[4], focusNode:  focuses[4]),
        OneDigitTextFieldBox(controller: controllers[5], focusNode:  focuses[5]),
      ],
    );
  }
}