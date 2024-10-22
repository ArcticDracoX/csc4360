import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

const tableFish = 'tableFish';

class RecipeDatabase
{
  static const _databaseName = "FishDatabase.db";
  static const _databaseVersion = 1;

  static const fish = 'fish';
  static const fishId = '_id';
  static const fishSpeed = 'speed';
  static const fishColour = 'colour';

  late Database _db;

  RecipeDatabase._init();

  Future<void> init() async
  {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async
  {
    await db.execute('''
      CREATE TABLE $fish (
        $fishId INTEGER PRIMARY KEY AUTOINCREMENT,
        $fishSpeed TEXT NOT NULL,
        $fishColour TEXT NOT NULL
      )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async
  {
    return await _db.insert(fish, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async
  {
    return await _db.query(fish);
  }

  Future<int> queryRowCount() async
  {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $fish');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> update(Map<String, dynamic> row) async
  {
    int id = row[fishId];
    return await _db.update(
      fish,
      row,
      where: '$fishId = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async
  {
    return await _db.delete(
      fish,
      where: '$fishId = ?',
      whereArgs: [id],
    );
  }
}