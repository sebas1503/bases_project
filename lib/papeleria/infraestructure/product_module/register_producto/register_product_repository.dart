import 'package:get/get.dart';
import 'package:software2/papeleria/domain/product_module/register_product/interface/i_register_product.dart';
import 'package:software2/papeleria/domain/product_module/register_product/model/product_model.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class RegisterProductRepository implements IRegisterProduct {
  @override
  Future<bool> registerProduct(Product product) async {
    Database? db;
    try {
      BaseSqliteService sqliteService = SqliteService();
      db = await sqliteService.openDB('Database.db');

      if (db != null) {
        return await db.insert('Producto', product.toJson()) > 0;
      }
    } catch (e) {
      Get.printError(info: "Error al insertar producto ----> $e");
      return false;
    }

    return false;
  }
}
