import 'package:get/get.dart';
import 'package:software2/_iatech/domain/register/model/aspirante_model.dart';
import 'package:software2/_iatech/domain/request/interface/i_request.dart';
import 'package:software2/_iatech/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/_iatech/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:sqflite/sqlite_api.dart';

class RequestRepository implements IRequest {
  @override
  Future<List<Candidate>> getRequest() async {
    Database? db;
    List<Candidate> response = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        var result = await db.query('Aspirantes');
        response = result.map((e) => Candidate.fromJson(e)).toList();
      }
    } catch (e) {
      Get.printError(info: "Error al insertar aspirante ----> $e");
      return [];
    }

    return response;
  }
}
