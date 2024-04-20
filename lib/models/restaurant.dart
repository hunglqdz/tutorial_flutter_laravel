import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'cart_item.dart';
import 'item.dart';

class Restaurant extends ChangeNotifier {
  final List<Item> _menu = [
    Item(
        imagePath: 'assets/items/bia_1664.jpg',
        name: 'Bia 1664 BLANC',
        price: 1.5,
        id: 0,
        takeaway: 1.5,
        category: ItemCategory.beer,
        availableAddons: [Addon(id: 0, name: 'Lạc luộc')]),
    Item(
        imagePath: 'assets/items/bia_budweiser.jpg',
        name: 'Bia Budweiser',
        price: 2,
        id: 0,
        takeaway: 2,
        category: ItemCategory.beer,
        availableAddons: [Addon(id: 0, name: 'Lạc luộc')]),
    Item(
        imagePath: 'assets/items/bia_hai_phong.jpg',
        name: 'Bia Hải Phòng',
        price: 2.5,
        id: 0,
        takeaway: 2.5,
        category: ItemCategory.beer,
        availableAddons: [Addon(id: 0, name: 'Lạc luộc')]),
    Item(
        imagePath: 'assets/items/cocacola.jpg',
        name: 'Cô ca cô la',
        price: 3,
        id: 0,
        takeaway: 3,
        category: ItemCategory.softdrink,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/com_ca.jpg',
        name: 'Cơm cá ba sa kho tộ',
        price: 2.5,
        id: 0,
        takeaway: 2.5,
        category: ItemCategory.rice,
        availableAddons: [Addon(id: 0, name: 'Canh')]),
    Item(
        imagePath: 'assets/items/com_ga.jpg',
        name: 'Cơm đùi gà xối mỡ',
        price: 5,
        id: 0,
        takeaway: 5,
        category: ItemCategory.rice,
        availableAddons: [Addon(id: 0, name: 'Canh')]),
    Item(
        imagePath: 'assets/items/com_suon.jpg',
        name: 'Cơm sườn nướng',
        price: 6.5,
        id: 0,
        takeaway: 6.5,
        category: ItemCategory.rice,
        availableAddons: [Addon(id: 0, name: 'Canh')]),
    Item(
        imagePath: 'assets/items/com_thit_kho.jpg',
        name: 'Cơm thịt kho với trứng',
        price: 7.5,
        id: 0,
        takeaway: 7.5,
        category: ItemCategory.rice,
        availableAddons: [Addon(id: 0, name: 'Canh')]),
    Item(
        imagePath: 'assets/items/fanta.jpg',
        name: 'Fanta',
        price: 8,
        id: 0,
        takeaway: 8,
        category: ItemCategory.softdrink,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/mi_pho_bo.jpg',
        name: 'Mì/Phở bò',
        price: 12.5,
        id: 0,
        takeaway: 12.5,
        category: ItemCategory.noodles,
        availableAddons: [Addon(id: 0, name: 'Rau thơm')]),
    Item(
        imagePath: 'assets/items/mi_pho_xao_bo.jpg',
        name: 'Mì/Phở xào bò',
        price: 2.5,
        id: 0,
        takeaway: 2.5,
        category: ItemCategory.noodles,
        availableAddons: [Addon(id: 0, name: 'Nước dùng')]),
    Item(
        imagePath: 'assets/items/mi_trung.jpg',
        name: 'Mì trứng',
        price: 3,
        id: 0,
        takeaway: 3,
        category: ItemCategory.noodles,
        availableAddons: [Addon(id: 0, name: 'Sting')]),
    Item(
        imagePath: 'assets/items/mien_tom.jpg',
        name: 'Miến tôm',
        price: 10,
        id: 0,
        takeaway: 10,
        category: ItemCategory.noodles,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/nuoc_suoi.jpg',
        name: 'Nước suối',
        price: 14.5,
        id: 0,
        takeaway: 14.5,
        category: ItemCategory.softdrink,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/ruou_trang.jpg',
        name: 'Rượu nếp trắng',
        price: 15,
        id: 0,
        takeaway: 15,
        category: ItemCategory.alcohol,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/ruou_vang.jpg',
        name: 'Rượu vang đỏ',
        price: 20,
        id: 0,
        takeaway: 20,
        category: ItemCategory.alcohol,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/ruou_whisky.jpg',
        name: 'Rượu Whisky',
        price: 5,
        id: 0,
        takeaway: 5,
        category: ItemCategory.alcohol,
        availableAddons: [Addon(id: 0, name: 'Boiled Peanuts')]),
    Item(
        imagePath: 'assets/items/sprite.jpg',
        name: 'Sprite',
        price: 14.5,
        id: 0,
        takeaway: 14.5,
        category: ItemCategory.softdrink,
        availableAddons: []),
  ];

  List<Item> get menu => _menu;
  List<CartItem> get cart => _cart;

  final List<CartItem> _cart = [];

  void addToCart(Item item, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((food) {
      bool isSameItem = food.item == item;
      bool isSameAddons =
          const ListEquality().equals(food.selectedAddons, selectedAddons);
      return isSameItem && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(item: item, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0;
    for (CartItem cartItem in _cart) {
      total += cartItem.item.price * cartItem.quantity;
    }
    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  String displayReceipt() {
    final receipt = StringBuffer();
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln('Date: $formattedDate');
    receipt.writeln();
    receipt.writeln('---------------');
    for (final cartItem in _cart) {
      receipt.writeln();
      receipt.writeln(
          '${cartItem.quantity} x ${cartItem.item.name} = ${_formatPrice(cartItem.item.price)}');
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln('Add-ons: ${_formatAddons(cartItem.selectedAddons)}');
      }
    }
    receipt.writeln();
    receipt.writeln('---------------');
    receipt.writeln();
    receipt.writeln('Total Items: ${getTotalItemCount()}');
    receipt.writeln('Total Price: ${_formatPrice(getTotalPrice())}');
    return receipt.toString();
  }

  String _formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }

  String _formatAddons(List<Addon> addons) {
    return addons.map((addon) => addon.name).join(', ');
  }
}
