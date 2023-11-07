import 'package:get/get.dart';
import 'package:software2/_iatech/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/_iatech/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class RegisterRepository {
  Future<bool> getProductsBanner() async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        List<Map> list = await db.query(
            distinct: true,
            columns: [
              'wp.*',
              'IFNULL(wp.PrecioBase * wd.precio , wp.PrecioBase) AS PrecioDescuento',
              'IFNULL(( (1 - wd.precio)  * 100 ),0) AS Descuento',
            ],
            'web_lista_precio_diario wp '
            'LEFT JOIN (select * from web_descuentos_diarios where desde = 0 and precio <>1) wd '
            ' ON wd.producto = wp.Codigo '
            'INNER JOIN bannersProductos bp '
            'ON bp.codigo = wp.Codigo ',
            where: 'bp.id = ?',
            whereArgs: []);

        if (list.isNotEmpty) {}
      }
    } catch (e) {
      Get.printError(info: "getUser -> $e");
    } finally {
      if (db != null && db.isOpen) {
        await db.close();
      }
    }

    return false;
  }
}
