import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../localization/locales.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final List<Item> items = [
    Item(
        image: Image.asset('assets/items/pizza.png'),
        name: 'Pizza',
        description: 'Melting cheese with different types of meat',
        price: 15),
    Item(
        image: Image.asset('assets/items/burger.png'),
        name: 'Burger',
        description: 'Beef, chicken with BBQ source',
        price: 10),
    Item(
        image: Image.asset('assets/items/steak.png'),
        name: 'Steak',
        description: 'Served with fried eggs and french fries',
        price: 9),
    Item(
        image: Image.asset('assets/items/pasta.png'),
        name: 'Pasta',
        description: 'From Italy?',
        price: 6.5),
    Item(
        image: Image.asset('assets/items/salad.png'),
        name: 'Salad',
        description: 'Not only for vegetarians',
        price: 3),
    Item(
        image: Image.asset('assets/items/beer.png'),
        name: 'Beer',
        description: 'Cool down',
        price: 2),
    Item(
        image: Image.asset('assets/items/soft-drink.png'),
        name: 'Soft drink',
        description: 'Coca, Sprite, Fanta',
        price: 1.5),
    Item(
        image: Image.asset('assets/items/coffee.png'),
        name: 'Coffee',
        description: 'Source for energy',
        price: 1),
    Item(
        image: Image.asset('assets/items/tea.png'),
        name: 'Tea',
        description: 'Green or herbal',
        price: 1),
    Item(
        image: Image.asset('assets/items/water.png'),
        name: 'Water',
        description: 'Healthy!',
        price: 0.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleData.items.getString(context)),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.notifications)],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(items[index].name),
            subtitle: Text(items[index].description),
            leading: items[index].image,
            trailing: Text('\$${items[index].price.toString()}'),
          );
        },
      ),
    );
  }
}

class Item {
  final Image image;
  final String name;
  final String description;
  final double price;

  Item(
      {required this.image,
      required this.name,
      required this.description,
      required this.price});
}
