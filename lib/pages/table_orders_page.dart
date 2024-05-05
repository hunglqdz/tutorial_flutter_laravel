import 'package:appdemo/widgets/my_table.dart';
import 'package:flutter/material.dart';

class TableOrdersPage extends StatefulWidget {
  const TableOrdersPage({super.key});

  @override
  State<TableOrdersPage> createState() => _TableOrdersPageState();
}

class _TableOrdersPageState extends State<TableOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('30',
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
                    Text('20',
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
          ),
          Container(
            color: Colors.orangeAccent,
            width: 300,
            height: 400,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Select Table'),
                ),
                Expanded(
                  child: Scrollbar(
                    thumbVisibility: true,
                    trackVisibility: true,
                    interactive: true,
                    thickness: 5,
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      children: List.generate(30, (index) {
                        return MyTable(index: index + 1);
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
