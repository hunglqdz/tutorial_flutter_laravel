// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

import '../localization/locales.dart';
import '../models/item.dart';
import '../models/restaurant.dart';
import '../models/table.dart';
import '../widgets/my_item.dart';
import 'cart_page.dart';

class TablePage extends StatefulWidget {
  MyTable table;
  TablePage({
    super.key,
    required this.table,
  });

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
          return MyItem(item: item);
        },
      );
    }).toList();
  }

  int _numOfPeople = 1;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Floor ${widget.table.floor} Table ${widget.table.id + 1}'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
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

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 175,
      decoration: const BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add Note',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Text('Number of People'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_numOfPeople > 1) {
                                  _numOfPeople--;
                                }
                              });
                            },
                            child: const Icon(
                              Icons.person_remove,
                              size: 30,
                            ),
                          ),
                          Text(
                            '$_numOfPeople',
                            style: const TextStyle(fontSize: 20),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_numOfPeople < 10) {
                                  _numOfPeople++;
                                }
                              });
                            },
                            child: const Icon(
                              Icons.person_add,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'ORDER',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
