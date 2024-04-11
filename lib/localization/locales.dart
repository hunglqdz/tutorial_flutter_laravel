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
  static const String table = 'table';
  static const String items = "items";
  static const String order = "order";
  static const String profile = "profile";
  static const String stats = 'stats';
  static const String breakfast = "breakfast";
  static const String lunch = "lunch";
  static const String dinner = 'dinner';

  static const Map<String, dynamic> EN = {
    language: 'English',
    hello: 'Hello',
    password: 'Password',
    table: 'Table',
    items: 'Items',
    order: 'Order',
    profile: 'Profile',
    stats: 'Stats',
    breakfast: 'Breakfast',
    lunch: 'Lunch',
    dinner: 'Dinner',
  };

  static const Map<String, dynamic> VI = {
    language: 'Tiếng Việt',
    hello: 'Xin chào',
    password: 'Mật khẩu',
    table: 'Bàn',
    items: 'Món ăn',
    order: 'Đặt hàng',
    profile: 'Hồ sơ',
    stats: 'Thống kê',
    breakfast: 'Bữa sáng',
    lunch: 'Bữa trưa',
    dinner: 'Bữa tối',
  };

  static const Map<String, dynamic> DE = {
    language: 'Deutsch',
    hello: 'Hallo',
    password: 'Passwort',
    table: 'Tisch',
    items: 'Artikel',
    order: 'Befehl',
    profile: 'Profil',
    stats: 'Statistiken',
    breakfast: 'Frühstück',
    lunch: 'Mittagessen',
    dinner: 'Abendessen',
  };
}
