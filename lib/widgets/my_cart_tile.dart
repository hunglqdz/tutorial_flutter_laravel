import 'package:appdemo/models/cart_item.dart';
import 'package:appdemo/widgets/my_quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(cartItem.item.imagePath),
              ),
              title: Text(cartItem.item.name),
              subtitle: Text(
                '${cartItem.item.price.toString()} VND',
                style: const TextStyle(color: Colors.orange),
              ),
              trailing: MyQuantitySelector(
                quantity: cartItem.quantity,
                item: cartItem.item,
                onIncrement: () {
                  restaurant.addToCart(cartItem.item, cartItem.selectedAddons);
                },
                onDecrement: () {
                  restaurant.removeFromCart(cartItem);
                },
              ),
            ),
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(10),
                children: cartItem.selectedAddons
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: FilterChip(
                          label: Text(addon.name),
                          shape: const StadiumBorder(
                              side: BorderSide(color: Colors.blueAccent)),
                          onSelected: (value) {},
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
