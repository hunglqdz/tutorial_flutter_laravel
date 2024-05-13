// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

import '../localization/locales.dart';
import '../models/item.dart';
import '../models/restaurant.dart';
import '../widgets/my_item.dart';
import 'detail_page.dart';

class TablePage extends StatefulWidget {
  const TablePage(int index, {super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage>
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
      appBar: AppBar(
        title: Text('Table $widget.index'),
      ),
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
