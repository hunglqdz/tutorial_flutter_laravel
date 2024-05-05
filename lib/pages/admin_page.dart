import 'package:appdemo/pages/customer_page.dart';
import 'package:appdemo/pages/report_page.dart';
import 'package:appdemo/pages/table_orders_page.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'orders_page.dart';
import 'quick_order_page.dart';
import 'calculator_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  // int index = 0;

  // final pages = [
  //   const TablePage(),
  //   const ItemsPage(),
  //   const OrderPage(),
  //   const CalculatorPage(),
  //   const StatsPage(),
  // ];

  // final icons = [
  //   const Icon(Icons.table_restaurant, size: 30),
  //   const Icon(Icons.fastfood, size: 30),
  //   const Icon(Icons.food_bank, size: 30),
  //   const Icon(Icons.calculate, size: 30),
  //   const Icon(Icons.bar_chart, size: 30),
  // ];

  int selectedIndex = 0;
  static const List<String> titles = [
    'Quick Order',
    'Table Orders',
    'Orders',
    'Report',
    'Customer',
    'Calculator'
  ];
  static List<Widget> pages = [
    const QuickOrderPage(),
    const TableOrdersPage(),
    const OrdersPage(),
    const ReportPage(),
    CustomerPage(),
    const CalculatorPage()
  ];

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      // bottomNavigationBar: Theme(
      //   data: Theme.of(context).copyWith(
      //     iconTheme: const IconThemeData(color: Colors.white),
      //   ),
      //   child: CurvedNavigationBar(
      //     color: Colors.orange,
      //     backgroundColor: Colors.transparent,
      //     height: 60,
      //     animationCurve: Curves.easeInOut,
      //     animationDuration: const Duration(milliseconds: 300),
      //     items: icons,
      //     index: index,
      //     onTap: (index) => setState(() => this.index = index),
      //   ),
      // ),
      // body: pages[index],
      appBar: AppBar(
        centerTitle: true,
        title: Text(titles[selectedIndex]),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: ListTile(
                leading: CircleAvatar(backgroundColor: Colors.blueAccent),
                title: Text('ADMIN'),
                subtitle: Text('admin@gmail.com'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.punch_clock),
              title: const Text('Quick Order'),
              selected: selectedIndex == 0,
              selectedColor: Colors.blueAccent,
              onTap: () {
                onTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.table_restaurant),
              title: const Text('Table Orders'),
              selected: selectedIndex == 1,
              selectedColor: Colors.blueAccent,
              onTap: () {
                onTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.checklist),
              title: const Text('Orders'),
              selected: selectedIndex == 2,
              selectedColor: Colors.blueAccent,
              onTap: () {
                onTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Report'),
              selected: selectedIndex == 3,
              selectedColor: Colors.blueAccent,
              onTap: () {
                onTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Customer'),
              selected: selectedIndex == 4,
              selectedColor: Colors.blueAccent,
              onTap: () {
                onTapped(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Calculator'),
              selected: selectedIndex == 5,
              selectedColor: Colors.blueAccent,
              onTap: () {
                onTapped(5);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}
