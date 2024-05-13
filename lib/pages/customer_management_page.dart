import 'package:appdemo/database/customer_db.dart';
import 'package:appdemo/models/customer.dart';
import 'package:flutter/material.dart';

import '../widgets/create_customer_widget.dart';

class CustomerManagementPage extends StatefulWidget {
  const CustomerManagementPage({super.key});

  @override
  State<CustomerManagementPage> createState() => _CustomerManagementPageState();
}

class _CustomerManagementPageState extends State<CustomerManagementPage> {
  Future<List<Customer>>? futureCustomers;
  final customerDB = CustomerDB();

  @override
  void initState() {
    super.initState();
    fetchCustomers();
  }

  void fetchCustomers() {
    setState(() {
      futureCustomers = customerDB.fetchAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => CreateCustomerWidget(
              onSubmit: (name, phone) async {
                await customerDB.create(name: name, phone: phone);
                if (!mounted) return;
                fetchCustomers();
                Navigator.pop(context);
              },
            ),
          );
        },
        child: const Icon(Icons.person_add),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            searchBox(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: Center(
                      child: Text('Name'),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Center(
                      child: Text('Phone'),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            FutureBuilder<List<Customer>>(
              future: futureCustomers,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final customers = snapshot.data!;
                  return customers.isEmpty
                      ? const Center(
                          child: Text('No customers yet. Please add some!'),
                        )
                      : Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                final customer = customers[index];
                                return GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          CreateCustomerWidget(
                                        customer: customer,
                                        onSubmit: (name, phone) async {
                                          await customerDB.update(
                                              id: customer.id,
                                              name: name,
                                              phone: phone);
                                          fetchCustomers();
                                          if (!mounted) return;
                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blueAccent),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            customer.name,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            customer.phone,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: IconButton(
                                            onPressed: () async {
                                              await customerDB
                                                  .delete(customer.id);
                                              fetchCustomers();
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 15),
                              itemCount: customers.length),
                        );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, size: 20),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
