import 'package:appdemo/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../database.dart';
import '../localization/locales.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final List<Item> breakfast = [
    Item(
        image: Image.asset('assets/items/garlicbread.jpg'),
        name: 'Garlic Bread',
        price: 1.5,
        id: 0,
        groupId: 0,
        takeaway: 0),
    Item(
        image: Image.asset('assets/items/pancake.jpg'),
        name: 'Pancake',
        price: 2,
        id: 0,
        groupId: 0,
        takeaway: 0),
    Item(
        image: Image.asset('assets/items/eggsbenedict.jpg'),
        name: 'Eggs Benedict',
        price: 2.5,
        id: 0,
        groupId: 0,
        takeaway: 0),
    Item(
        image: Image.asset('assets/items/sandwich.jpg'),
        name: 'Sandwich',
        price: 3,
        id: 0,
        groupId: 0,
        takeaway: 0),
  ];

  final List<Item> lunch = [
    Item(
        image: Image.asset('assets/items/mashedpotatoes.jpg'),
        name: 'Mashed Potatoes',
        price: 2.5,
        id: 0,
        groupId: 0,
        takeaway: 0),
    Item(
        image: Image.asset('assets/items/salad.jpg'),
        name: 'Russian Salad',
        price: 5,
        id: 0,
        groupId: 0,
        takeaway: 0),
    Item(
        image: Image.asset('assets/items/spaghetti.jpg'),
        name: 'Spaghetti',
        price: 6.5,
        id: 0,
        groupId: 0,
        takeaway: 0),
    Item(
        image: Image.asset('assets/items/hamburger.jpg'),
        name: 'Hamburger',
        price: 7.5,
        id: 0,
        groupId: 0,
        takeaway: 0),
    Item(
        image: Image.asset('assets/items/steak.jpg'),
        name: 'Beef Steak',
        price: 8,
        id: 0,
        groupId: 0,
        takeaway: 0),
    Item(
        image: Image.asset('assets/items/pizza.jpg'),
        name: 'Pizza',
        price: 12.5,
        id: 0,
        groupId: 0,
        takeaway: 0),
  ];

  final List<Item> dinner = [
    Item(
        image: Image.asset('assets/items/garlicsoup.jpg'),
        name: 'Garlic Soup',
        price: 2.5,
        id: 0,
        groupId: 0,
        takeaway: 0),
    Item(
        image: Image.asset('assets/items/cheesebakedpotatoes.jpg'),
        name: 'Cheese Baked Potatoes',
        price: 3,
        id: 0,
        groupId: 0,
        takeaway: 0),
    Item(
        image: Image.asset('assets/items/beefstewwithvegetables.jpg'),
        name: 'Beef Stew With Vegetables',
        price: 10,
        id: 0,
        groupId: 0,
        takeaway: 0),
    Item(
        image: Image.asset('assets/items/salmonwithpassionfruitsauce.jpg'),
        name: 'Salmon With Passion Fruit Sauce',
        price: 14.5,
        id: 0,
        groupId: 0,
        takeaway: 0),
    Item(
        image: Image.asset('assets/items/bakedchicken.jpg'),
        name: 'Baked Chicken',
        price: 15,
        id: 0,
        groupId: 0,
        takeaway: 0),
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              LocaleData.breakfast.getString(context),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: breakfast.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                name: breakfast[index].name,
                price: breakfast[index].price,
                image: breakfast[index].image,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              LocaleData.lunch.getString(context),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lunch.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                name: lunch[index].name,
                price: lunch[index].price,
                image: lunch[index].image,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              LocaleData.dinner.getString(context),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dinner.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                name: dinner[index].name,
                price: dinner[index].price,
                image: dinner[index].image,
              );
            },
          ),
        ],
      ),
    );
  }
}
