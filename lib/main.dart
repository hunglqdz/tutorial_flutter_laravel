import 'package:appdemo/localization/locales.dart';
import 'package:appdemo/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

import 'pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Restaurant(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    configureLocalization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      home: const LoginPage(),
    );
  }

  void configureLocalization() {
    localization.init(mapLocales: LOCALES, initLanguageCode: 'en');
    localization.onTranslatedLanguage = onTranslatedLanguage;
  }

  void onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }
}
