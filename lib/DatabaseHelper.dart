import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  String databaseName = "database.db";
  int databaseVersion = 1;
  String databaseTable = "";
  String columnUsername = "";
  String columnPassword = "";
  String columnSalt = "";

  static Database _db;

  Future<Database> get database async{
    if(_db != null) {
      return _db;
    }
    else {
      initDatabase();
      return _db;
    }
  }

  initDatabase() async{
    
  }

}