import 'package:get/get.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:sqflite/sqlite_api.dart';

import '../model/comparative_months_report2_model.dart';

class ComparativeMonthsReport2ViewModel extends GetxController {
  RxList<ComparativeMonthsReporte2Model> listData =
      <ComparativeMonthsReporte2Model>[].obs;
  RxList<String> clients = <String>[].obs;
  RxString selectedClient = ''.obs;

  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    listData.clear();
    listData.value = await getComparativeMonthsReport2();
  }

  Future<List<ComparativeMonthsReporte2Model>>
      getComparativeMonthsReport2() async {
    List<ComparativeMonthsReporte2Model> listInformation = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      Database db = await sqliteService.openDB('Database.db');

      String statement = '''
SELECT 
    strftime('%Y', c.fecha) AS anio,
    strftime('%m', c.fecha) AS mes,
    SUM(dc.cantidad * dc.precioUnitario) AS ventasTotales
FROM 
    Compra c
JOIN 
    DetalleCompra dc ON c.idCompra = dc.idCompra
GROUP BY 
    strftime('%Y', c.fecha), strftime('%m', c.fecha)
ORDER BY 
    strftime('%Y', c.fecha), strftime('%m', c.fecha)
      ''';

      List<Map> list = await db.rawQuery(statement);
      listInformation = List<ComparativeMonthsReporte2Model>.from(
          list.map((x) => ComparativeMonthsReporte2Model.fromJson(x)));
      return listInformation;
    } catch (e) {
      Get.printError(info: "$e");
      return [];
    }
  }

  static ComparativeMonthsReport2ViewModel get findOrInitialize {
    try {
      return Get.find<ComparativeMonthsReport2ViewModel>();
    } catch (e) {
      Get.put(ComparativeMonthsReport2ViewModel());
      return Get.find<ComparativeMonthsReport2ViewModel>();
    }
  }
}
