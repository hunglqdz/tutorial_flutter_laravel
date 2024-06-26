import 'package:appdemo/localization/locales.dart';
import 'package:appdemo/pages/customer_management_page.dart';
import 'package:appdemo/pages/report_page.dart';
import 'package:appdemo/pages/table_reservation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

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
  int selectedIndex = 0;
  static List<String> titles = [
    'Quick Order',
    'Table Reservation',
    'Orders',
    'Report',
    'Customer Management',
    'Calculator'
  ];
  static List<Widget> pages = [
    const QuickOrderPage(),
    const TableReservationPage(),
    const OrdersPage(),
    const ReportPage(),
    const CustomerManagementPage(),
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
        width: MediaQuery.of(context).size.width * .5,
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
              title: Text(LocaleData.quickorder.getString(context)),
              selected: selectedIndex == 0,
              selectedColor: Colors.blueAccent,
              onTap: () {
                onTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.table_restaurant),
              title: Text(LocaleData.tablereservation.getString(context)),
              selected: selectedIndex == 1,
              selectedColor: Colors.blueAccent,
              onTap: () {
                onTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.checklist),
              title: Text(LocaleData.orders.getString(context)),
              selected: selectedIndex == 2,
              selectedColor: Colors.blueAccent,
              onTap: () {
                onTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: Text(LocaleData.report.getString(context)),
              selected: selectedIndex == 3,
              selectedColor: Colors.blueAccent,
              onTap: () {
                onTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(LocaleData.customermanagement.getString(context)),
              selected: selectedIndex == 4,
              selectedColor: Colors.blueAccent,
              onTap: () {
                onTapped(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: Text(LocaleData.calculator.getString(context)),
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
