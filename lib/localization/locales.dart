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
  static const String tablereservation = 'tablereservation';
  static const String orders = "orders";
  static const String quickorder = "quickorder";
  static const String calculator = "calculator";
  static const String report = 'report';
  static const String customermanagement = 'customermanagement';

  static const String rice = "rice";
  static const String noodles = "noodles";
  static const String softdrink = 'softdrink';
  static const String beer = "beer";
  static const String alcohol = 'alcohol';
  static const String addon = 'addon';
  static const String dessert = "dessert";
  static const String beverage = "beverage";
  static const String addtocart = "addtocart";
  static const String cart = "cart";

  static const Map<String, dynamic> EN = {
    language: 'English',
    login: 'Login',
    password: 'Password',
    tablereservation: 'Table Reservation',
    orders: 'Orders',
    quickorder: 'Quick Order',
    calculator: 'Calculator',
    report: 'Report',
    customermanagement: 'Customer Management',
    rice: 'Rice',
    noodles: 'Noodles',
    softdrink: 'Soft Drink',
    beer: 'Beer',
    alcohol: 'Alcohol',
    addon: 'Add-ons',
    dessert: 'Dessert',
    beverage: 'Beverage',
    addtocart: 'Add to Cart',
    cart: 'Cart'
  };

  static const Map<String, dynamic> VI = {
    language: 'Tiếng Việt',
    login: 'Đăng nhập',
    password: 'Mật khẩu',
    tablereservation: 'Đặt bàn',
    orders: 'Đơn hàng',
    quickorder: 'Đặt hàng nhanh',
    calculator: 'Máy tính',
    report: 'Báo cáo',
    customermanagement: 'Quản lí khách hàng',
    rice: 'Cơm',
    noodles: 'Mỳ/Miến/Phở',
    softdrink: 'Nước ngọt',
    beer: 'Bia',
    alcohol: 'Rượu',
    addon: 'Ăn kèm',
    dessert: 'Tráng miệng',
    beverage: 'Đồ uống',
    addtocart: 'Thêm vào giỏ hàng',
    cart: 'Giỏ hàng'
  };

  static const Map<String, dynamic> DE = {
    language: 'Deutsch',
    login: 'Anmeldung',
    password: 'Passwort',
    tablereservation: 'Tischreservierung',
    orders: 'Aufträge',
    quickorder: 'Befehl',
    calculator: 'Taschenrechner',
    report: 'Bericht',
    customermanagement: 'Kundenmanagement',
    rice: 'Reis',
    noodles: 'Nudeln',
    softdrink: 'Erfrischungsgetränk',
    beer: 'Bier',
    alcohol: 'Alkohol',
    addon: 'Gericht zusammen',
    dessert: 'Nachspeisen',
    beverage: 'Getränk',
    addtocart: 'in den Warenkorb legen',
    cart: 'Wagen'
  };
}
