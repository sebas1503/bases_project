import 'package:get/get.dart';
import 'package:software2/papeleria/domain/client_module/edit_client/interface/i_edit_client.dart';
import 'package:software2/papeleria/domain/client_module/register_client/model/client_model.dart';

import 'package:software2/papeleria/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:sqflite/sqlite_api.dart';

class EditClientRepository implements IEditClient {
  @override
  Future<List<Client>> getClients(String search) async {
    Database? db;
    List<Client> response = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        var result = await db.query('Cliente',
            where: 'idCliente LIKE ? or nombreUno LIKE ? or nombreDos LIKE ?',
            whereArgs: ['%$search%', '%$search%', '%$search%']);
        response = result.map((e) => Client.fromJson(e)).toList();
      }
    } catch (e) {
      Get.printError(info: "Error al obtener cliente ----> $e");
      return [];
    }

    return response;
  }

  @override
  Future<bool> deleteClient({required String id}) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        return await db
                .delete('Cliente', where: 'idCliente = ?', whereArgs: [id]) >
            0;
      }
    } catch (e) {
      Get.printError(info: "Error al elimiar cliente ----> $e");
      return false;
    }

    return false;
  }

  @override
  Future<bool> updateClient({required Client client}) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        return await db.update(
              'Cliente',
              client.toJson(),
              where: 'idCliente = ?',
              whereArgs: [client.idClient],
            ) >
            0;
      }
    } catch (e) {
      Get.printError(info: "Error al actualizar cliente ----> $e");
      return false;
    }

    return false;
  }
}
