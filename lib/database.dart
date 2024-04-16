class ItemGroup {
  int id;
  String name;
  ItemGroup({
    required this.id,
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
