import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "salary.db";
  static const _databaseVersion = 1;

  String tableDetails = 'salary_details';
  String tableMoney = 'salary_money';

  String columnInsertId = '_id';
  String columnimpDate = 'imp_date';
  String columnimpTime = 'imp_time';
  String columnoutDate = 'out_date';
  String columnoutTime = 'out_time';
  String columnPrice = 'salary_price';
  String columnJob = 'job_time';
  String columnDescImp = 'imp_description';
  String columnDescOut = 'out_description';

  String columnMoneyId = '_id';
  String columnMoney = 'money';

  late Database _db;

  // this opens the database (and creates it if it doesn't exist)
  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableDetails (
            $columnInsertId INTEGER PRIMARY KEY,
            $columnimpDate STRING NOT NULL,
            $columnimpTime STRING NOT NULL,
            $columnoutDate STRING NOT NULL,
            $columnoutTime STRING NOT NULL,
            $columnPrice STRING NOT NULL,
            $columnJob STRING NOT NULL,
            $columnDescImp STRING NOT NULL,
            $columnDescOut STRING NOT NULL
          )
          ''');
    await db.execute('''
          CREATE TABLE $tableMoney (
            $columnMoneyId INTEGER PRIMARY KEY,
            $columnMoney STRING NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row,String tableName) async {
    return await _db.insert(tableName, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async {
    return await _db.query(tableName);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount(String tableName) async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $tableName');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row,String tableName,String idName) async {

    log(tableName+"   "+idName);

    int id = row[idName];
    return await _db.update(
      tableName,
      row,
      where: '$idName = ?',
      whereArgs: [id],
    );
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id,String tableName,String idName) async {
    return await _db.delete(
      tableName,
      where: '$idName = ?',
      whereArgs: [id],
    );
  }
}