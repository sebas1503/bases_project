import 'package:get/get.dart';
import 'package:software2/_iatech/domain/register/interface/i_register.dart';
import 'package:software2/_iatech/domain/register/model/aspirante_model.dart';
import 'package:software2/_iatech/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/_iatech/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class RegisterRepository implements IRegister {
  @override
  Future<bool> registerUser(Candidate candidate) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        return await db.insert('Aspirantes', candidate.toJson()) > 0;
      }
    } catch (e) {
      Get.printError(info: "Error al insertar aspirante ----> $e");
      return false;
    }

    return false;
  }
}
