import 'package:get/get.dart';
import 'package:software2/papeleria/domain/product_module/edit_product/interface/i_edit_product.dart';
import 'package:software2/papeleria/domain/product_module/register_product/model/product_model.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:sqflite/sqlite_api.dart';

class EditProductRepository implements IEditProduct {
  @override
  Future<List<Product>> getProduct(String search) async {
    Database? db;
    List<Product> response = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        var result = await db.query('Producto',
            where: 'idProducto LIKE ? or nombre LIKE ? ',
            whereArgs: ['%$search%', '%$search%']);
        response = result.map((e) => Product.fromJson(e)).toList();
      }
    } catch (e) {
      Get.printError(info: "Error al obtener producto ----> $e");
      return [];
    }
    return response;
  }

  @override
  Future<bool> deleteProduct({required String id}) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        return await db
                .delete('Producto', where: 'idProducto = ?', whereArgs: [id]) >
            0;
      }
    } catch (e) {
      Get.printError(info: "Error al elimiar producto ----> $e");
      return false;
    }

    return false;
  }

  @override
  Future<bool> updateProduct({required Product product}) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        return await db.update(
              'Producto',
              product.toJson(),
              where: 'idProducto = ?',
              whereArgs: [product.idProduct],
            ) >
            0;
      }
    } catch (e) {
      Get.printError(info: "Error al actualizar producto ----> $e");
      return false;
    }

    return false;
  }
}
