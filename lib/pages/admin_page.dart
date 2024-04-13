import 'package:appdemo/pages/order_page.dart';
import 'package:appdemo/pages/stats_page.dart';
import 'package:appdemo/pages/table_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'items_page.dart';
import 'calculator_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int index = 0;

  final pages = [
    const TablePage(),
    const ItemsPage(),
    const OrderPage(),
    const CalculatorPage(),
    const StatsPage(),
  ];

  final icons = [
    const Icon(Icons.table_restaurant, size: 30),
    const Icon(Icons.fastfood, size: 30),
    const Icon(Icons.food_bank, size: 30),
    const Icon(Icons.calculate, size: 30),
    const Icon(Icons.bar_chart, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          color: Colors.orange,
          backgroundColor: Colors.transparent,
          height: 60,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          items: icons,
          index: index,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
      body: pages[index],
    );
  }
}
