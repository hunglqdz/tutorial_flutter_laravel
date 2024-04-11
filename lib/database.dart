// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ItemGroup {
  int id;
  String name;
  ItemGroup({
    required this.id,
    required this.name,
  });
}

class Item {
  int id;
  int groupId;
  Image image;
  String name;
  double price;
  double takeaway;
  Item({
    required this.id,
    required this.groupId,
    required this.image,
    required this.name,
    required this.price,
    required this.takeaway,
  });
}

class SideDish {
  int id;
  int itemId;
  String name;
  SideDish({
    required this.id,
    required this.itemId,
    required this.name,
  });
}

class Floor {
  int id;
  String name;
  Floor({
    required this.id,
    required this.name,
  });
}

class Table {
  int id;
  int floorId;
  String floorName;
  Table({
    required this.id,
    required this.floorId,
    required this.floorName,
  });
}

class Bill {
  int id;
  DateTime dateTime;
  int tableId;
  double total;
  double discount;
  bool status;
  bool sync;
  Bill({
    required this.id,
    required this.dateTime,
    required this.tableId,
    required this.total,
    required this.discount,
    required this.status,
    required this.sync,
  });
}

class Payment {
  int id;
  int billId;
  DateTime dateTime;
  double total;
  double discount;
  String method;
  bool sync;
  Payment({
    required this.id,
    required this.billId,
    required this.dateTime,
    required this.total,
    required this.discount,
    required this.method,
    required this.sync,
  });
}
