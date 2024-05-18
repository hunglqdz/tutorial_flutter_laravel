import 'package:appdemo/pages/admin_page.dart';
import 'package:appdemo/widgets/my_receipt.dart';
import 'package:flutter/material.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.print),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminPage(),
                ),
              );
            },
            icon: const Icon(Icons.keyboard_return),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: MyReceipt(),
      ),
    );
  }
}
