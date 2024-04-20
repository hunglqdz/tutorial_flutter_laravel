import 'package:appdemo/database/database_service.dart';
import 'package:sqflite/sqflite.dart';

import '../models/order.dart';

class RestaurantDB {
  final tableName = 'orders';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName(
      "id" INTEGER NOT NULL,
      "tableId" INTEGER NOT NULL,
      "date" INTEGER NOT NULL DEFAULT (cast(strftime('%s','now') as int)),
      PRIMARY KEY("id" AUTOINCREMENT)
    );""");
  }

  Future<int> create({required int tableId}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
      '''INSERT INTO $tableName (tableId,date) VALUES (?,?)''',
      [tableId, DateTime.now().millisecondsSinceEpoch],
    );
  }

  Future<List<Order>> fetchAll() async {
    final database = await DatabaseService().database;
    final orders = await database
        .rawQuery('''SELECT * from $tableName ORDER BY COALESCE(date)''');
    return orders.map((order) => Order.fromSqfliteDatabase(order)).toList();
  }

  Future<Order> fetchById(int id) async {
    final database = await DatabaseService().database;
    final order = await database
        .rawQuery('''SELECT * from $tableName WHERE id = ?''', [id]);
    return Order.fromSqfliteDatabase(order.first);
  }

  Future<int> update({required int id, int? tableId}) async {
    final database = await DatabaseService().database;
    return await database.update(
      tableName,
      {
        if (tableId != null) 'tableId': tableId,
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
