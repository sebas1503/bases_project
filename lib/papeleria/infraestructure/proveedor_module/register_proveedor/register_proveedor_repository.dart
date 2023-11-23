import 'package:get/get.dart';
import 'package:software2/papeleria/domain/proveedor_module/register_proveedor/interface/i_register_proveedor.dart';
import 'package:software2/papeleria/domain/proveedor_module/register_proveedor/model/proveedor_model.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class RegisterProveedorRepository implements IRegisterProveedor {
  @override
  Future<bool> registerProveedor(Proveedor proveedor) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        return await db.insert('Provedor', proveedor.toJson()) > 0;
      }
    } catch (e) {
      Get.printError(info: "Error al insertar proveedor ----> $e");
      return false;
    }

    return false;
  }
}
