import 'package:appdemo/localization/locales.dart';
import 'package:appdemo/models/item.dart';
import 'package:appdemo/models/restaurant.dart';
import 'package:appdemo/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

import 'detail_page.dart';

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
        padding: EdgeInsets.zero,
        itemCount: categoryMenu.length,
        itemBuilder: (context, index) {
          final item = categoryMenu[index];
          return ItemWidget(
            item: item,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(item: item),
              ),
            ),
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
        // body: NestedScrollView(
        //   headerSliverBuilder: (context, innerBoxIsScrolled) =>
        //       [AppBar(title: MyTabBar(tabController: _tabController))],
        // body: Consumer<Restaurant>(
        //   builder: (context, restaurant, child) => TabBarView(
        //     controller: _tabController,
        //     children: getItemInThisCategory(restaurant.menu),
        //   ),
        // ),
        // ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(LocaleData.items.getString(context)),
          centerTitle: true,
          leading: const Icon(Icons.menu),
          actions: const [Icon(Icons.shopping_cart)],
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            controller: _tabController,
            indicatorWeight: 5,
            labelStyle: const TextStyle(fontSize: 20),
            labelPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: LocaleData.appetizer.getString(context)),
              Tab(text: LocaleData.main.getString(context)),
              Tab(text: LocaleData.side.getString(context)),
              Tab(text: LocaleData.dessert.getString(context)),
              Tab(text: LocaleData.beverage.getString(context)),
            ],
          ),
        ),
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getItemInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
