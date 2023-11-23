import 'package:get/get.dart';
import 'package:software2/papeleria/domain/client_module/register_client/interface/i_register_client.dart';
import 'package:software2/papeleria/domain/client_module/register_client/model/client_model.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class RegisterRepository implements IRegisterClient {
  @override
  Future<bool> registerClient(Client client) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        return await db.insert('Cliente', client.toJson()) > 0;
      }
    } catch (e) {
      Get.printError(info: "Error al insertar cliente ----> $e");
      return false;
    }

    return false;
  }
}
