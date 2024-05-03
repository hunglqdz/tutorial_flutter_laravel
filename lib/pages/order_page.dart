import 'package:appdemo/database/restaurant_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:intl/intl.dart';

import '../localization/locales.dart';
import '../models/order.dart';
import '../widgets/create_order_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Future<List<Order>>? futureOrders;
  final restaurantDB = RestaurantDB();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() {
    setState(() {
      futureOrders = restaurantDB.fetchAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(LocaleData.order.getString(context)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => CreateOrderWidget(
                  onSubmit: (tableId) async {
                    await restaurantDB.create(tableId: tableId);
                    if (!mounted) return;
                    fetchOrders();
                    Navigator.of(context).pop();
                  },
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder<List<Order>>(
          future: futureOrders,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final orders = snapshot.data!;
              return orders.isEmpty
                  ? const Center(
                      child: Text('No orders yet'),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        final order = orders[index];
                        final subtitle = DateFormat('yyyy/MM/dd')
                            .format(DateTime.parse(order.date));
                        return ListTile(
                          title: Text(order.tableId.toString()),
                          subtitle: Text(subtitle),
                          trailing: IconButton(
                            onPressed: () async {
                              await restaurantDB.delete(order.id);
                              fetchOrders();
                            },
                            icon: const Icon(Icons.delete),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => CreateOrderWidget(
                                onSubmit: (tableId) async {
                                  await restaurantDB.update(
                                      id: order.id, tableId: tableId);
                                  fetchOrders();
                                  if (!mounted) return;
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: orders.length);
            }
          })),
      // body: Padding(
      //   padding: const EdgeInsets.all(15),
      //   child: Column(
      //     children: [
      //       const Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           Column(
      //             children: [
      //               Text('9',
      //                   style: TextStyle(
      //                       color: Colors.red,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 20)),
      //               Text('New',
      //                   style: TextStyle(
      //                       color: Colors.red,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 20)),
      //             ],
      //           ),
      //           Column(
      //             children: [
      //               Text('9',
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold, fontSize: 20)),
      //               Text('Active',
      //                   style: TextStyle(
      //                       color: Colors.grey,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 20)),
      //             ],
      //           ),
      //           Column(
      //             children: [
      //               Text('10',
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold, fontSize: 20)),
      //               Text('Completed',
      //                   style: TextStyle(
      //                       color: Colors.grey,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 20)),
      //             ],
      //           ),
      //         ],
      //       ),
      //       Expanded(
      //         child: ListView.builder(
      //           itemCount: 5,
      //           itemBuilder: (context, index) => const MyOrder(),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
