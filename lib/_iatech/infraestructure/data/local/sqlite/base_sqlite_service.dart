import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';

abstract class BaseSqliteService {
  Future saveDBZip(Uint8List bytes);
  Future<dynamic> openDB(String db);
  Future<dynamic> closeDB(Database db);
  Future<String> compressFileTemp();
}
