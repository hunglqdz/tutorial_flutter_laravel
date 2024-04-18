import 'package:appdemo/localization/locales.dart';
import 'package:appdemo/models/restaurant.dart';
import 'package:appdemo/widgets/my_cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

import 'payment_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleData.cart.getString(context)),
            actions: [
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                  'Are you sure you want to clear the cart?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    restaurant.clearCart();
                                  },
                                  child: const Text('Yes'),
                                ),
                              ],
                            ));
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text('Cart is empty'),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                final cartItem = userCart[index];
                                return MyCartTile(cartItem: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const PaymentPage())));
                },
                child: const Text('Go to payment page'),
              ),
              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
