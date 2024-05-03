import 'package:appdemo/models/item.dart';
import 'package:flutter/material.dart';

class MyItem extends StatelessWidget {
  final Item item;
  final void Function()? onTap;

  const MyItem({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(shape: BoxShape.rectangle),
                    width: 150,
                    height: 150,
                    child: Image.asset(item.imagePath),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${item.price.toString()} VND',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.orange),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(endIndent: 25, indent: 25),
      ],
    );
  }
}
