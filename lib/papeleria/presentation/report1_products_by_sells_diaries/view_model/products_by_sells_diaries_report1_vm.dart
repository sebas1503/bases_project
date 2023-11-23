import 'package:get/get.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:software2/papeleria/presentation/report1_products_by_sells_diaries/model/products_by_sellers_report1_model.dart';
import 'package:software2/shared/util/util.dart';
import 'package:sqflite/sqlite_api.dart';

class ProductsBySellsDiariesReportViewModel extends GetxController {
  RxList<ProductsBySellsDiariesReporte1Model> listProducts =
      <ProductsBySellsDiariesReporte1Model>[].obs;
  RxString date = ''.obs;

  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    date.value = Util.data.getCurrentDate();
    listProducts.value = await getProductsBySellsDiariesReport1();
  }

  Future<List<ProductsBySellsDiariesReporte1Model>>
      getProductsBySellsDiariesReport1() async {
    List<ProductsBySellsDiariesReporte1Model> listProducts = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      Database db = await sqliteService.openDB('Database.db');
      String date1 = date + ' 00:00:00';
      String date2 = date + ' 23:59:59';

      String statement = '''
   SELECT 
    c.fecha AS fechaVenta,
    cl.nombreUno AS nombreCliente,
    cl.apellidoUno AS apellidoCliente,
    e.nombreUno AS nombreEmpleado,
    e.apellidoUno AS apellidoEmpleado,
    p.nombre AS nombreProducto,
    dc.cantidad,
    dc.precioUnitario 
FROM 
    Compra c
JOIN 
    Cliente cl ON c.idCliente = cl.idCliente
JOIN 
    Empleado e ON c.idEmpleado = e.idEmpleado
JOIN 
    DetalleCompra dc ON c.idCompra = dc.idCompra
JOIN 
    Producto p ON dc.idProducto = p.idProducto
WHERE 
    c.fecha BETWEEN '$date1' AND '$date2'
ORDER BY 
    c.fecha, cl.nombreUno, cl.apellidoUno, p.nombre
      ''';

      List<Map> list = await db.rawQuery(statement);
      listProducts = List<ProductsBySellsDiariesReporte1Model>.from(
          list.map((x) => ProductsBySellsDiariesReporte1Model.fromJson(x)));
      return listProducts;
    } catch (e) {
      Get.printError(info: "$e");
      return [];
    }
  }

  static ProductsBySellsDiariesReportViewModel get findOrInitialize {
    try {
      return Get.find<ProductsBySellsDiariesReportViewModel>();
    } catch (e) {
      Get.put(ProductsBySellsDiariesReportViewModel());
      return Get.find<ProductsBySellsDiariesReportViewModel>();
    }
  }
}
