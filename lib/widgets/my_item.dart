import 'package:appdemo/models/item.dart';
import 'package:flutter/material.dart';

class MyItem extends StatelessWidget {
  final Item item;
  final void Function()? onTap;

  const MyItem({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        width: 150,
        height: 200,
        child: Column(
          children: [
            Image.asset(item.imagePath,
                width: 200, height: 120, fit: BoxFit.fill),
            Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '${item.price.toString()} VND',
              style: const TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
