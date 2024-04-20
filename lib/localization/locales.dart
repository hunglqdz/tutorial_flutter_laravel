import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale('en', LocaleData.EN),
  MapLocale('vi', LocaleData.VI),
  MapLocale('de', LocaleData.DE)
];

mixin LocaleData {
  static const String language = "language";
  static const String login = "login";
  static const String password = "password";
  static const String table = 'table';
  static const String items = "items";
  static const String order = "order";
  static const String calculator = "calculator";
  static const String stats = 'stats';
  static const String rice = "rice";
  static const String noodles = "noodles";
  static const String softdrink = 'softdrink';
  static const String beer = "beer";
  static const String alcohol = 'alcohol';
  static const String side = 'side';
  static const String dessert = "dessert";
  static const String beverage = "beverage";
  static const String addtocart = "addtocart";
  static const String cart = "cart";

  static const Map<String, dynamic> EN = {
    language: 'English',
    login: 'Login',
    password: 'Password',
    table: 'Table',
    items: 'Items',
    order: 'Order',
    calculator: 'Calculator',
    stats: 'Stats',
    rice: 'Rice',
    noodles: 'Noodles',
    softdrink: 'Soft Drink',
    beer: 'Beer',
    alcohol: 'Alcohol',
    side: 'Side',
    dessert: 'Dessert',
    beverage: 'Beverage',
    addtocart: 'Add to cart',
    cart: 'Cart'
  };

  static const Map<String, dynamic> VI = {
    language: 'Tiếng Việt',
    login: 'Đăng nhập',
    password: 'Mật khẩu',
    table: 'Bàn',
    items: 'Món ăn',
    order: 'Đặt hàng',
    calculator: 'Máy tính',
    stats: 'Thống kê',
    rice: 'Cơm',
    noodles: 'Mỳ/Miến/Phở',
    softdrink: 'Nước ngọt',
    beer: 'Bia',
    alcohol: 'Rượu',
    side: 'Ăn kèm',
    dessert: 'Tráng miệng',
    beverage: 'Đồ uống',
    addtocart: 'Thêm vào giỏ hàng',
    cart: 'Giỏ hàng'
  };

  static const Map<String, dynamic> DE = {
    language: 'Deutsch',
    login: 'Anmeldung',
    password: 'Passwort',
    table: 'Tisch',
    items: 'Artikel',
    order: 'Befehl',
    calculator: 'Taschenrechner',
    stats: 'Statistiken',
    rice: 'Reis',
    noodles: 'Nudeln',
    softdrink: 'Erfrischungsgetränk',
    beer: 'Bier',
    alcohol: 'Alkohol',
    side: 'Gericht zusammen',
    dessert: 'Nachspeisen',
    beverage: 'Getränk',
    addtocart: 'in den Warenkorb legen',
    cart: 'Wagen'
  };
}
