import 'package:get/get.dart';
import 'package:software2/papeleria/domain/proveedor_module/edit_proveedor/interface/i_edit_empleado.dart';
import 'package:software2/papeleria/domain/proveedor_module/register_proveedor/model/proveedor_model.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:sqflite/sqlite_api.dart';

class EditProveedorRepository implements IEditProveedor {
  @override
  Future<List<Proveedor>> getProveedor(String search) async {
    Database? db;
    List<Proveedor> response = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        var result = await db.query('Provedor',
            where: 'idProvedor LIKE ? or nombreUno LIKE ? or nombreDos LIKE ?',
            whereArgs: ['%$search%', '%$search%', '%$search%']);
        response = result.map((e) => Proveedor.fromJson(e)).toList();
      }
    } catch (e) {
      Get.printError(info: "Error al obtener proveedor ----> $e");
      return [];
    }

    return response;
  }

  @override
  Future<bool> deleteProveedor({required String id}) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        return await db
                .delete('Provedor', where: 'idProvedor = ?', whereArgs: [id]) >
            0;
      }
    } catch (e) {
      Get.printError(info: "Error al elimiar proveedor ----> $e");
      return false;
    }

    return false;
  }

  @override
  Future<bool> updateProveedor({required Proveedor proveedor}) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        return await db.update(
              'Provedor',
              proveedor.toJson(),
              where: 'idProvedor = ?',
              whereArgs: [proveedor.idProveedor],
            ) >
            0;
      }
    } catch (e) {
      Get.printError(info: "Error al actualizar proveedor ----> $e");
      return false;
    }

    return false;
  }
}
