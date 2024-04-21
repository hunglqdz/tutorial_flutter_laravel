import 'package:appdemo/models/item.dart';

class CartItem {
  Item item;
  List<Addon> selectedAddons;
  int quantity;
  CartItem({
    required this.item,
    required this.selectedAddons,
    this.quantity = 1,
  });

  int get totalPrice {
    return item.price * quantity;
  }
}
