import 'package:appdemo/models/item.dart';
import 'package:appdemo/models/restaurant.dart';
import 'package:appdemo/widgets/my_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: ItemCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Item> _filterMenuByCategory(ItemCategory category, List<Item> fullMenu) {
    return fullMenu.where((item) => item.category == category).toList();
  }

  List<Widget> getItemInThisCategory(List<Item> fullMenu) {
    return ItemCategory.values.map((category) {
      List<Item> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categoryMenu[index].name),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [AppBar(title: MyTabBar(tabController: _tabController))],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
              controller: _tabController,
              children: getItemInThisCategory(restaurant.menu),
            ),
          ),
        ),
        // body: ListView(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(16),
        //       child: Text(
        //         LocaleData.breakfast.getString(context),
        //         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        //       ),
        //     ),
        // ListView.builder(
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemCount: breakfast.length,
        //   itemBuilder: (context, index) {
        //     return ItemWidget(
        //       name: breakfast[index].name,
        //       price: breakfast[index].price,
        //       image: breakfast[index].image,
        //     );
        //   },
        // ),
        //     Padding(
        //       padding: const EdgeInsets.all(16),
        //       child: Text(
        //         LocaleData.lunch.getString(context),
        //         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        //       ),
        //     ),
        //     ListView.builder(
        //       shrinkWrap: true,
        //       physics: const NeverScrollableScrollPhysics(),
        //       itemCount: lunch.length,
        //       itemBuilder: (context, index) {
        //         return ItemWidget(
        //           name: lunch[index].name,
        //           price: lunch[index].price,
        //           image: lunch[index].image,
        //         );
        //       },
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(16),
        //       child: Text(
        //         LocaleData.dinner.getString(context),
        //         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        //       ),
        //     ),
        //     ListView.builder(
        //       shrinkWrap: true,
        //       physics: const NeverScrollableScrollPhysics(),
        //       itemCount: dinner.length,
        //       itemBuilder: (context, index) {
        //         return ItemWidget(
        //           name: dinner[index].name,
        //           price: dinner[index].price,
        //           image: dinner[index].image,
        //         );
        //       },
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
