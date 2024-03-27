import 'package:flutter/material.dart';

import 'key_pad.dart';

class CodeUnlock extends StatefulWidget {
  const CodeUnlock({super.key});

  @override
  _CodeUnlockState createState() => _CodeUnlockState();
}

class _CodeUnlockState extends State {
  String displayCode = '';
  TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
        backgroundColor: Colors.blue,
      ),
      body: Builder(
        builder: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 50, bottom: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.key,
                      color: Colors.blue,
                    ),
                    Text(
                      'Password',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 15),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextField(
                      controller: pinController,
                      readOnly: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              KeyPad(
                pinController: pinController,
                isPinLogin: false,
                onChange: (String pin) {
                  pinController.text = pin;
                  setState(() {});
                },
                onSubmit: (String pin) {
                  if (pin.length != 4) {
                    (pin.isEmpty)
                        ? showInSnackBar('Please Enter Password')
                        : showInSnackBar('Wrong Password');
                    return;
                  } else {
                    pinController.text = pin;

                    if (pinController.text == displayCode) {
                      showInSnackBar('Password Match');
                      setState(() {});
                    } else {
                      showInSnackBar('Wrong Password');
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}
