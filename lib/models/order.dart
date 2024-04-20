class Order {
  final int id;
  final int tableId;
  final String date;

  Order({
    required this.id,
    required this.tableId,
    required this.date,
  });

  factory Order.fromSqfliteDatabase(Map<String, dynamic> map) => Order(
      id: map['id']?.toInt() ?? 0,
      tableId: map['tableId']?.toInt() ?? 0,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']).toIso8601String());
}
