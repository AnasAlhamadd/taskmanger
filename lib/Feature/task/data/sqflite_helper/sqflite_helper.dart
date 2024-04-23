import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  Database? _database;

  Future<Database?> get db async {
    if (_database == null) {
      _database = await initDb();
      return _database;
    } else {
      return _database;
    }
  }

//!initDB()
  Future<Database> initDb() async {
    String path = await getDatabasesPath();
    String database = join(path, 'task.db');
    Database mydb = await openDatabase(database,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE tasks(
   id INTEGER  PRIMARY KEY AUTOINCREMENT,
   title TEXT,
   date TEXT,
   notes TEXT,
   startTime TEXT,
   endTime TEXT,
   color INTEGER,
   isCompleted INTEGER
 ) 
''').then((value) => print('On Create Data Base And Table'));
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print('================================OnUpgrade');
  }

//!CRUD()
  dynamic mysql({required String table, required String sql}) async {
    Database? db = await initDb();
    switch (table) {
      case 'select':
        return await db.rawQuery(sql);
      case 'insert':
        return await db.rawInsert(sql);
      case 'update':
        return await db.rawUpdate(sql);
      case 'delete':
        return await db.rawDelete(sql);
    }
  }
}
