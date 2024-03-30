import 'package:appdemo/pages/table_page.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _currentIndex = 0;

  final tabs = [
    const TablePage(),
    const Center(child: Text('tab2')),
    const Center(child: Text('tab3')),
    const Center(child: Text('tab4')),
    const Center(child: Text('tab5')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tables'),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.notifications)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.table_restaurant),
            label: 'Table',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lunch_dining),
            label: 'Items',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dining),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
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
