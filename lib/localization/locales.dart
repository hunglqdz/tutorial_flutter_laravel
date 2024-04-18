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
  static const String breakfast = "breakfast";
  static const String lunch = "lunch";
  static const String dinner = 'dinner';
  static const String appetizer = "appetizer";
  static const String main = 'main';
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
    breakfast: 'Breakfast',
    lunch: 'Lunch',
    dinner: 'Dinner',
    appetizer: 'Appetizer',
    main: 'Main',
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
    breakfast: 'Bữa sáng',
    lunch: 'Bữa trưa',
    dinner: 'Bữa tối',
    appetizer: 'Khai vị',
    main: 'Món chính',
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
    breakfast: 'Frühstück',
    lunch: 'Mittagessen',
    dinner: 'Abendessen',
    appetizer: 'Vorspeise',
    main: 'Hauptgang',
    side: 'Gericht zusammen',
    dessert: 'Nachspeisen',
    beverage: 'Getränk',
    addtocart: 'in den Warenkorb legen',
    cart: 'Wagen'
  };
}
