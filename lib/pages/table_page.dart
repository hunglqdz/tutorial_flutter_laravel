import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tables'),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.notifications)],
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('15',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  Text('All',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                ],
              ),
              Column(
                children: [
                  Text('5',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Text('Free',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ],
              ),
              Column(
                children: [
                  Text('10',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  Text('Reserved',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            color: Colors.orangeAccent,
            width: 300,
            height: 350,
            child: Column(
              children: [
                const Text(
                  'Select Table',
                  style: TextStyle(color: Colors.grey),
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: 90,
                        height: 90,
                        color: Colors.white,
                        child: const Text('1'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: 90,
                        height: 90,
                        color: Colors.white,
                        child: const Text('2'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: 90,
                        height: 90,
                        color: Colors.white,
                        child: const Text('3'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: 90,
                        height: 90,
                        color: Colors.white,
                        child: const Text('4'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: 90,
                        height: 90,
                        color: Colors.white,
                        child: const Text('5'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: 90,
                        height: 90,
                        color: Colors.white,
                        child: const Text('6'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: 90,
                        height: 90,
                        color: Colors.white,
                        child: const Text('7'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: 90,
                        height: 90,
                        color: Colors.white,
                        child: const Text('8'),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: 90,
                        height: 90,
                        color: Colors.white,
                        child: const Text('9'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('Summary: 120.25'),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.search),
            label: const Text('view'),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.payment),
            label: const Text('payment'),
          ),
        ],
      ),
    );
  }
}
