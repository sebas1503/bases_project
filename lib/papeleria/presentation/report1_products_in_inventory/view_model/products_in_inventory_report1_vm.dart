import 'package:get/get.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:software2/papeleria/presentation/report1_products_by_sells_diaries/model/products_by_sellers_report1_model.dart';
import 'package:software2/shared/util/util.dart';
import 'package:sqflite/sqlite_api.dart';

import '../model/products_in_inventory_report1_model.dart';

class ProductsByInventoryReportViewModel extends GetxController {
  RxList<ProductsByInInventoryReporte1Model> listProducts =
      <ProductsByInInventoryReporte1Model>[].obs;

  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    listProducts.value = await getProductsInInventoryReport1();
  }

  Future<List<ProductsByInInventoryReporte1Model>>
      getProductsInInventoryReport1() async {
    List<ProductsByInInventoryReporte1Model> listProducts = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      Database db = await sqliteService.openDB('Database.db');

      String statement = '''
   SELECT 
p.idProducto,
    p.nombre AS producto,
    SUM(i.cantidad) AS cantidadDisponible  
FROM 
    Producto p
JOIN 
    Inventario i ON p.idProducto = i.idProducto
GROUP BY 
    p.nombre
ORDER BY 
    p.nombre
      ''';

      List<Map> list = await db.rawQuery(statement);
      listProducts = List<ProductsByInInventoryReporte1Model>.from(
          list.map((x) => ProductsByInInventoryReporte1Model.fromJson(x)));
      return listProducts;
    } catch (e) {
      Get.printError(info: "$e");
      return [];
    }
  }

  static ProductsByInventoryReportViewModel get findOrInitialize {
    try {
      return Get.find<ProductsByInventoryReportViewModel>();
    } catch (e) {
      Get.put(ProductsByInventoryReportViewModel());
      return Get.find<ProductsByInventoryReportViewModel>();
    }
  }
}
