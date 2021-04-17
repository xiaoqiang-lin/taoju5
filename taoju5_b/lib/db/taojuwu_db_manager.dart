import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TaojuwuDbManager {
  static const DB_NAME = "taojuwu.db";

  static const DB_VERSION = 1;

  static Database _db;
  //初始化
  static init() async {
    String dbPath = await getDatabasesPath();
    String fullPath = join(dbPath, DB_NAME);
    _db = await openDatabase(fullPath,
        version: DB_VERSION, onCreate: (Database db, int version) async {});
  }

  static createTable(
      {@required String tableName, @required String createSql}) async {
    bool isExist = await isTableExits(tableName);
    if (isExist) return;
    await _db.execute(createSql);
  }

  //判断表是否存在
  static Future<bool> isTableExits(String tableName) async {
    await getCurrentDatabase();
    var res = await _db.rawQuery(
        "select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res != null && res.length > 0;
  }

  ///获取当前数据库对象
  static Future<Database> getCurrentDatabase() async {
    if (_db == null) {
      await init();
    }
    return _db;
  }

  ///关闭
  static close() {
    _db?.close();
    _db = null;
  }
}
