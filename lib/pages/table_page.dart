import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('15'),
                Text('All'),
              ],
            ),
            Column(
              children: [
                Text(
                  '5',
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  'Free',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '10',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Reserved',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Select Table',
                style: TextStyle(color: Colors.grey),
              ),
              GridView.count(
                padding: const EdgeInsets.all(10),
                crossAxisCount: 3,
                children: List.generate(9, (index) {
                  return Column(
                    children: [Text('$index'), const Text('Table')],
                  );
                }),
              ),
            ],
          ),
        ),
        const Text('Summary: 120.25'),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.search),
          label: const Text('view'),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.payment),
          label: const Text('payment'),
        ),
      ],
    );
  }
}
