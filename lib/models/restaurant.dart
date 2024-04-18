import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'cart_item.dart';
import 'item.dart';

class Restaurant extends ChangeNotifier {
  final List<Item> _menu = [
    Item(
        imagePath: 'assets/items/appetizer/garlicbread.jpg',
        name: 'Garlic Bread',
        price: 1.5,
        id: 0,
        takeaway: 1.5,
        category: ItemCategory.appetizer,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/dessert/pancake.jpg',
        name: 'Pancake',
        price: 2,
        id: 0,
        takeaway: 2,
        category: ItemCategory.dessert,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/main/eggsbenedict.jpg',
        name: 'Eggs Benedict',
        price: 2.5,
        id: 0,
        takeaway: 2.5,
        category: ItemCategory.main,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/main/sandwich.jpg',
        name: 'Sandwich',
        price: 3,
        id: 0,
        takeaway: 3,
        category: ItemCategory.main,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/side/mashedpotatoes.jpg',
        name: 'Mashed Potatoes',
        price: 2.5,
        id: 0,
        takeaway: 2.5,
        category: ItemCategory.side,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/side/salad.jpg',
        name: 'Salad',
        price: 5,
        id: 0,
        takeaway: 5,
        category: ItemCategory.side,
        availableAddons: [Addon(id: 0, name: 'Boiled Egg')]),
    Item(
        imagePath: 'assets/items/main/spaghetti.jpg',
        name: 'Spaghetti',
        price: 6.5,
        id: 0,
        takeaway: 6.5,
        category: ItemCategory.main,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/main/hamburger.jpg',
        name: 'Hamburger',
        price: 7.5,
        id: 0,
        takeaway: 7.5,
        category: ItemCategory.main,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/main/steak.jpg',
        name: 'Steak',
        price: 8,
        id: 0,
        takeaway: 8,
        category: ItemCategory.main,
        availableAddons: [Addon(id: 0, name: 'French Fries')]),
    Item(
        imagePath: 'assets/items/main/pizza.jpg',
        name: 'Pizza',
        price: 12.5,
        id: 0,
        takeaway: 12.5,
        category: ItemCategory.main,
        availableAddons: [Addon(id: 0, name: 'Powdered cheese')]),
    Item(
        imagePath: 'assets/items/appetizer/garlicsoup.jpg',
        name: 'Garlic Soup',
        price: 2.5,
        id: 0,
        takeaway: 2.5,
        category: ItemCategory.appetizer,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/side/cheesebakedpotatoes.jpg',
        name: 'Cheese Baked Potatoes',
        price: 3,
        id: 0,
        takeaway: 3,
        category: ItemCategory.side,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/main/beefstewwithvegetables.jpg',
        name: 'Beef Stew With Vegetables',
        price: 10,
        id: 0,
        takeaway: 10,
        category: ItemCategory.main,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/main/salmonwithpassionfruitsauce.jpg',
        name: 'Salmon With Passion Fruit Sauce',
        price: 14.5,
        id: 0,
        takeaway: 14.5,
        category: ItemCategory.main,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/main/bakedchicken.jpg',
        name: 'Baked Chicken',
        price: 15,
        id: 0,
        takeaway: 15,
        category: ItemCategory.main,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/beverage/wine.jpg',
        name: 'Wine',
        price: 20,
        id: 0,
        takeaway: 20,
        category: ItemCategory.beverage,
        availableAddons: []),
    Item(
        imagePath: 'assets/items/beverage/beer.jpg',
        name: 'Beer',
        price: 5,
        id: 0,
        takeaway: 5,
        category: ItemCategory.beverage,
        availableAddons: [Addon(id: 0, name: 'Boiled Peanuts')]),
  ];

  List<Item> get menu => _menu;
  List<CartItem> get cart => _cart;

  final List<CartItem> _cart = [];

  void addToCart(Item item, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhere((food) {
      bool isSameItem = food.item == item;
      bool isSameAddons =
          const ListEquality().equals(food.selectedAddons, selectedAddons);
      return isSameItem && isSameAddons;
    });
    cartItem.quantity++;
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
    receipt.writeln("Here's your receipt");
    receipt.writeln();
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('----------');
    for (final cartItem in _cart) {
      receipt.writeln(
          '${cartItem.quantity} x ${cartItem.item.name} - ${_formatPrice(cartItem.item.price)}');
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln('Add-ons: ${_formatAddons(cartItem.selectedAddons)}');
      }
      receipt.writeln();
    }
    receipt.writeln('----------');
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
