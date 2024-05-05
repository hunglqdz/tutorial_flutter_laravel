import 'package:sqflite/sqflite.dart';
import 'package:appdemo/database/database_service.dart';
import 'package:appdemo/models/customer.dart';

class CustomerDB {
  final tableName = 'customers';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName(
      "id" INTEGER NOT NULL,
      "name" TEXT NOT NULL,
      "phone" TEXT NOT NULL,
      PRIMARY KEY("id" AUTOINCREMENT)
    );""");
  }

  Future<int> create({required String name, required String phone}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (name,phone) VALUES (?,?)''',
      [name, phone],
    );
  }

  Future<List<Customer>> fetchAll() async {
    final database = await DatabaseService().database;
    final customers = await database.rawQuery('''SELECT * from $tableName''');
    return customers
        .map((customer) => Customer.fromSqfliteDatabase(customer))
        .toList();
  }

  Future<int> update(
      {required int id, required String name, required String phone}) async {
    final database = await DatabaseService().database;
    return await database.update(
      tableName,
      {
        'name': name,
        'phone': phone,
      },
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [id],
    );
  }

  Future<void> delete(int id) async {
    final database = await DatabaseService().database;
    await database.rawDelete('''DELETE FROM $tableName WHERE id = ?''', [id]);
  }
}
