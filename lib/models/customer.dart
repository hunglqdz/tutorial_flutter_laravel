class Customer {
  final int id;
  final String name;
  final String phone;

  Customer({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Customer.fromSqfliteDatabase(Map<String, dynamic> map) => Customer(
      id: map['id'] ?? 0, name: map['name'] ?? '', phone: map['phone'] ?? '');
}
