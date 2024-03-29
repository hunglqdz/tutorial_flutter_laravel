import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale('en', LocaleData.EN),
  MapLocale('vi', LocaleData.VI),
  MapLocale('de', LocaleData.DE)
];

mixin LocaleData {
  static const String language = "language";
  static const String hello = "hello";
  static const String password = "password";

  static const Map<String, dynamic> EN = {
    language: 'English',
    hello: 'Hello',
    password: 'Password'
  };

  static const Map<String, dynamic> VI = {
    language: 'Tiếng Việt',
    hello: 'Xin chào',
    password: 'Mật khẩu'
  };

  static const Map<String, dynamic> DE = {
    language: 'Deutsch',
    hello: 'Hallo',
    password: 'Passwort'
  };
}
