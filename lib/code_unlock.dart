import 'package:appdemo/localization/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'key_pad.dart';

class CodeUnlock extends StatefulWidget {
  const CodeUnlock({super.key});

  @override
  _CodeUnlockState createState() => _CodeUnlockState();
}

class _CodeUnlockState extends State {
  late FlutterLocalization _flutterLocalization;
  late String _currentLocale;

  String displayCode = '';
  TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleData.hello.getString(context)),
        actions: [
          DropdownButton(
            items: const [
              DropdownMenuItem(
                value: 'en',
                child: Text('English'),
              ),
              DropdownMenuItem(
                value: 'vi',
                child: Text('Tiếng Việt'),
              ),
              DropdownMenuItem(
                value: 'de',
                child: Text('Deutsch'),
              ),
            ],
            value: _currentLocale,
            onChanged: (value) {
              _setLocale(value);
            },
          )
        ],
      ),
      body: Builder(
        builder: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, bottom: 15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.key,
                      color: Colors.orange,
                    ),
                    Text(
                      LocaleData.password.getString(context),
                      style: const TextStyle(fontSize: 15),
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
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
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

  void _setLocale(String? value) {
    if (value == null) return;
    if (value == 'en') {
      _flutterLocalization.translate('en');
    } else if (value == 'vi') {
      _flutterLocalization.translate('vi');
    } else if (value == 'de') {
      _flutterLocalization.translate('de');
    } else {
      return;
    }
    setState(() {
      _currentLocale = value;
    });
  }
}
