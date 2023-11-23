import 'package:get/get.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

import '../../../domain/empleado_module/register_empleado/interface/i_register_empleado.dart';
import '../../../domain/empleado_module/register_empleado/model/empleado_model.dart';

class RegisterEmpleadoRepository implements IRegisterEmpleado {
  @override
  Future<bool> registerEmpleado(Empleado empleado) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        return await db.insert('Empleado', empleado.toJson()) > 0;
      }
    } catch (e) {
      Get.printError(info: "Error al insertar empleado ----> $e");
      return false;
    }

    return false;
  }
}
