// ignore_for_file: public_member_api_docs, sort_constructors_first
class Item {
  final int id;
  final String imagePath;
  final String name;
  final double price;
  final double takeaway;
  final ItemCategory category;
  List<Addon> availableAddons;
  Item({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.takeaway,
    required this.category,
    required this.availableAddons,
  });
}

enum ItemCategory { appetizer, main, side, dessert, beverage }

class Addon {
  int id;
  String name;
  Addon({
    required this.id,
    required this.name,
  });
}
