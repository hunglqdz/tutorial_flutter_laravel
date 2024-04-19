import 'package:appdemo/models/item.dart';
import 'package:flutter/material.dart';

class MyQuantitySelector extends StatelessWidget {
  final int quantity;
  final Item item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const MyQuantitySelector(
      {super.key,
      required this.quantity,
      required this.item,
      required this.onIncrement,
      required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onDecrement,
            child: const Icon(
              Icons.remove,
              size: 20,
            ),
          ),
          SizedBox(
            width: 20,
            child: Center(
              child: Text(quantity.toString()),
            ),
          ),
          GestureDetector(
            onTap: onIncrement,
            child: const Icon(
              Icons.add,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
