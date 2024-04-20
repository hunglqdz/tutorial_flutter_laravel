import 'package:appdemo/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Thank you for your order!'),
            const SizedBox(height: 25),
            const Text('Here is your receipt:'),
            const SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(25),
              child: Consumer<Restaurant>(
                  builder: (context, restaurant, child) =>
                      Text(restaurant.displayReceipt())),
            )
          ],
        ),
      ),
    );
  }
}
