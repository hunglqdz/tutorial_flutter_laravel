import 'package:appdemo/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../localization/locales.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return ItemCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 5,
      labelPadding: EdgeInsets.zero,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      tabs: [
        Tab(text: LocaleData.appetizer.getString(context)),
        Tab(text: LocaleData.main.getString(context)),
        Tab(text: LocaleData.side.getString(context)),
        Tab(text: LocaleData.dessert.getString(context)),
        Tab(text: LocaleData.beverage.getString(context)),
      ],
    );
  }
}
