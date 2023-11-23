import 'package:get/get.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../../domain/empleado_module/edit_empleado/interface/i_edit_empleado.dart';
import '../../../domain/empleado_module/register_empleado/model/empleado_model.dart';

class EditEmpleadoRepository implements IEditEmpleado {
  @override
  Future<List<Empleado>> getEmpleados(String search) async {
    Database? db;
    List<Empleado> response = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        var result = await db.query('Empleado',
            where: 'idEmpleado LIKE ? or nombreUno LIKE ? or nombreDos LIKE ?',
            whereArgs: ['%$search%', '%$search%', '%$search%']);
        response = result.map((e) => Empleado.fromJson(e)).toList();
      }
    } catch (e) {
      Get.printError(info: "Error al obtener empleado ----> $e");
      return [];
    }

    return response;
  }

  @override
  Future<bool> deleteEmpleado({required String id}) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        return await db
                .delete('Empleado', where: 'idEmpleado = ?', whereArgs: [id]) >
            0;
      }
    } catch (e) {
      Get.printError(info: "Error al elimiar empleado ----> $e");
      return false;
    }

    return false;
  }

  @override
  Future<bool> updateEmpleado({required Empleado empleado}) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        return await db.update(
              'Empleado',
              empleado.toJson(),
              where: 'idCliente = ?',
              whereArgs: [empleado.idEmpleado],
            ) >
            0;
      }
    } catch (e) {
      Get.printError(info: "Error al actualizar empleado ----> $e");
      return false;
    }

    return false;
  }
}
