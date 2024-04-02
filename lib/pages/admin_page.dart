import 'package:appdemo/pages/table_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../localization/locales.dart';
import 'items_page.dart';
import 'profile_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _currentIndex = 0;

  final tabs = [
    const TablePage(),
    const ItemsPage(),
    const Center(child: Text('tab3')),
    const ProfilePage(),
    const Center(child: Text('tab5')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.table_restaurant),
            label: LocaleData.table.getString(context),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.lunch_dining),
            label: LocaleData.items.getString(context),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.dining),
            label: LocaleData.order.getString(context),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: LocaleData.profile.getString(context),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bar_chart),
            label: LocaleData.stats.getString(context),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: tabs[_currentIndex],
    );
  }
}
