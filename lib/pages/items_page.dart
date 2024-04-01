import 'package:flutter/material.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final List<String> items = [
    'Pizza',
    'Burger',
    'Salad',
    'Pasta',
    'Sushi',
    'Steak',
    'Ice Cream',
    'Coffee',
    'Tea',
    'Soda',
    'Juice',
    'Water'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.search)],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {},
          );
        },
      ),
    );
  }
}
