import 'package:get/get.dart';
import 'package:software2/papeleria/domain/report1_products_by_category/interface/i_products_report1.dart';
import 'package:software2/papeleria/domain/report1_products_by_category/model/products_report1_model.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:sqflite/sqlite_api.dart';

class ProductsByCategoryRepository implements IProductByCategoryReport1 {
  @override
  Future<List<ProductsReporte1Model>> getProductsReport1(
      String category) async {
    List<ProductsReporte1Model> listProducts = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      Database db = await sqliteService.openDB('Database.db');

      String statement = '''
       SELECT 
    cp.nombre AS categoria,
    p.nombre AS nombreProducto,
    p.descripcion,
    p.precio
FROM 
    Producto p
JOIN 
    CategoriaProducto cp ON p.categoria = cp.idCategoriaProducto
WHERE 
    cp.nombre = '$category'
ORDER BY 
    p.nombre;
      ''';

      List<Map> list = await db.rawQuery(statement);
      listProducts = List<ProductsReporte1Model>.from(
          list.map((x) => ProductsReporte1Model.fromJson(x)));
      return listProducts;
    } catch (e) {
      Get.printError(info: "$e");
      return [];
    }
  }

  @override
  Future<List<String>> getCategories() async {
    List<String> listProducts = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      Database db = await sqliteService.openDB('Database.db');

      String statement = '''
     SELECT DISTINCT
    nombre AS categoria
FROM 
    CategoriaProducto
      ''';

      List<Map> list = await db.rawQuery(statement);
      listProducts = List<String>.from(list.map((x) => x['categoria']));
      return listProducts;
    } catch (e) {
      Get.printError(info: "$e");
      return [];
    }
  }
}
