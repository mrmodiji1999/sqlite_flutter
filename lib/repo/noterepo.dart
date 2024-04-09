import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_flutter/models/model.dart';

class noterepo {
  static const _dbname = 'notedatabase.db';
  static const _tablename = 'notes';

  static Future<Database> _database() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _dbname),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tablename(Id INTEGER PRIMARY KEY, Title TEXT, Description text,Create_at text )',
        );
      },
      version: 1,
    );
    return database;
  }

  static Insert({required notes note}) async {
    final db = await _database();
    await db.insert(
      _tablename,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<notes>> getnote() async {
    final db = await _database();

    final List<Map<String, Object?>> maps = await db.query(_tablename);

    return List.generate(maps.length, (i) {
      return notes(
          Title: maps[i]['Title'] as String,
          Description: maps[i]['Description'] as String,
          // Create_at:DateTime.parse(  maps[i]['Description']) as String,
          Id: maps[i]['Id'] as int);
    });
  }

  static update({required notes note}) async {
    final db = await _database();

    // Update the given Dog.
    await db.update(
      _tablename,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.Id],
    );
  }
   static delete({required notes note}) async {
     final db = await _database();

  // Remove the Dog from the database.
  await db.delete(
    _tablename,
    // Use a `where` clause to delete a specific dog.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [note.Id],
  );
  }
}
