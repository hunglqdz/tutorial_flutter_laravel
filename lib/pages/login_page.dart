import 'package:appdemo/localization/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../widgets/key_pad.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State {
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
        backgroundColor: Colors.orange,
        title: Text(LocaleData.hello.getString(context)),
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
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 222, 222, 222)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      pinController.text.replaceAll(RegExp(r'.'), '*'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
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
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlagButton(
                      flagImage: 'assets/flags/usa.png', languageCode: 'en'),
                  FlagButton(
                      flagImage: 'assets/flags/vietnam.png',
                      languageCode: 'vi'),
                  FlagButton(
                      flagImage: 'assets/flags/germany.png',
                      languageCode: 'de'),
                ],
              )
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

class FlagButton extends StatelessWidget {
  final String flagImage;
  final String languageCode;

  final FlutterLocalization _flutterLocalization = FlutterLocalization.instance;

  FlagButton({
    super.key,
    required this.flagImage,
    required this.languageCode,
  });

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
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _setLocale(languageCode);
      },
      child: Image.asset(
        flagImage,
        width: 100,
        height: 50,
      ),
    );
  }
}
