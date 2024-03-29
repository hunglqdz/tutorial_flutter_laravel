import 'package:flutter/material.dart';

import 'pages/admin_page.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('7'),
              buttonWidget('8'),
              buttonWidget('9'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('4'),
              buttonWidget('5'),
              buttonWidget('6'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('1'),
              buttonWidget('2'),
              buttonWidget('3'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buttonWidget('0'),
              functionButtonWidget('Del', () {
                if (pinController.text.isNotEmpty) {
                  pinController.text = pinController.text
                      .substring(0, pinController.text.length - 1);
                }
                if (pinController.text.length > 5) {
                  pinController.text = pinController.text.substring(0, 3);
                }
                onChange(pinController.text);
              }),
              functionButtonWidget('Enter', () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AdminPage(),
                  ),
                );
              })
              // !isPinLogin
              //     ? functionButtonWidget('Enter', () {
              //         if (pinController.text.length > 5) {
              //           pinController.text = pinController.text.substring(0, 3);
              //         }
              //         onSubmit(pinController.text);
              //       })
              //     : Container(width: 100),
            ],
          ),
        ],
      ),
    );
  }

  buttonWidget(String buttonText) {
    return Container(
      margin: const EdgeInsets.all(5),
      color: Colors.grey,
      height: 40,
      width: 80,
      child: TextButton(
        // style: ButtonStyle(
        //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //     const RoundedRectangleBorder(
        //       borderRadius: BorderRadius.zero,
        //     ),
        //   ),
        // ),
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
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  functionButtonWidget(String buttonText, Function() function) {
    return Container(
      margin: const EdgeInsets.all(5),
      color: Colors.grey,
      height: 40,
      width: 80,
      child: TextButton(
        // style: ButtonStyle(
        //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //     const RoundedRectangleBorder(
        //       borderRadius: BorderRadius.zero,
        //     ),
        //   ),
        // ),
        onPressed: function,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: buttonText == 'Del' ? Colors.black : Colors.red,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
