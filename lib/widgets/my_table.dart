// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../localization/locales.dart';

class MyTable extends StatefulWidget {
  int index;
  MyTable({
    super.key,
    required this.index,
  });

  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  Color tableColor = Colors.white;

  void changeColor() {
    setState(() {
      if (tableColor == Colors.white) {
        tableColor = Colors.blueAccent;
      } else {
        tableColor = Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: changeColor,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 90,
        height: 90,
        color: tableColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleData.table.getString(context)),
            Text(
              '${widget.index}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
