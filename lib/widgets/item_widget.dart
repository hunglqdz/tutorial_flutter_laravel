import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  Image image;
  String name;
  double price;

  ItemWidget({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text('\$$price'),
      leading: image,
    );
  }
}
