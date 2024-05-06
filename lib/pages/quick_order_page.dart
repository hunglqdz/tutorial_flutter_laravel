import 'package:appdemo/localization/locales.dart';
import 'package:appdemo/models/item.dart';
import 'package:appdemo/models/restaurant.dart';
import 'package:appdemo/widgets/my_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

import 'detail_page.dart';

class QuickOrderPage extends StatefulWidget {
  const QuickOrderPage({super.key});

  @override
  State<QuickOrderPage> createState() => _QuickOrderPageState();
}

class _QuickOrderPageState extends State<QuickOrderPage>
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
      return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: categoryMenu.length,
        itemBuilder: (context, index) {
          final item = categoryMenu[index];
          return MyItem(
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
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            indicatorWeight: 5,
            indicatorColor: Colors.blueAccent,
            labelStyle: const TextStyle(fontSize: 20),
            labelPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: LocaleData.rice.getString(context)),
              Tab(text: LocaleData.noodles.getString(context)),
              Tab(text: LocaleData.softdrink.getString(context)),
              Tab(text: LocaleData.beer.getString(context)),
              Tab(text: LocaleData.alcohol.getString(context)),
            ],
          ),
          Expanded(
            child: Consumer<Restaurant>(
              builder: (context, restaurant, child) => TabBarView(
                controller: _tabController,
                children: getItemInThisCategory(restaurant.menu),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
