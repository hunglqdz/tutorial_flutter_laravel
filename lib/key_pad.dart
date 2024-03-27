import 'package:flutter/material.dart';

class KeyPad extends StatelessWidget {
  final TextEditingController pinController;
  final Function onChange;
  final Function onSubmit;
  final bool isPinLogin;

  const KeyPad(
      {super.key,
      required this.onChange,
      required this.onSubmit,
      required this.pinController,
      required this.isPinLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('7'),
              buttonWidget('8'),
              buttonWidget('9'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('4'),
              buttonWidget('5'),
              buttonWidget('6'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('1'),
              buttonWidget('2'),
              buttonWidget('3'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('0'),
              functionButtonWidget('Esc', () {
                if (pinController.text.isNotEmpty) {
                  pinController.text = pinController.text
                      .substring(0, pinController.text.length - 1);
                }
                if (pinController.text.length > 5) {
                  pinController.text = pinController.text.substring(0, 3);
                }
                onChange(pinController.text);
              }),
              !isPinLogin
                  ? functionButtonWidget('Enter', () {
                      if (pinController.text.length > 5) {
                        pinController.text = pinController.text.substring(0, 3);
                      }
                      onSubmit(pinController.text);
                    })
                  : Container(width: 100),
            ],
          ),
        ],
      ),
    );
  }

  buttonWidget(String buttonText) {
    return SizedBox(
      height: 50,
      width: 100,
      child: TextButton(
        onPressed: () {
          if (pinController.text.length <= 3) {
            pinController.text = pinController.text + buttonText;
            onChange(pinController.text);
          }
        },
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }

  functionButtonWidget(String buttonText, Function() function) {
    return SizedBox(
      height: 50,
      width: 100,
      child: TextButton(
        onPressed: function,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: buttonText == 'Esc' ? Colors.black : Colors.red,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
