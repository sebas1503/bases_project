import 'package:get/get.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/base_sqlite_service.dart';
import 'package:software2/papeleria/infraestructure/data/local/sqlite/sqlite_service.dart';
import 'package:sqflite/sqlite_api.dart';

import '../model/sells_by_client_report2_model.dart';

class SellsByClientReport2ViewModel extends GetxController {
  RxList<SellsByClientReporte2Model> listProducts =
      <SellsByClientReporte2Model>[].obs;
  RxList<String> clients = <String>[].obs;
  RxString selectedClient = ''.obs;

  void onInit() {
    super.onInit();
    getClients();
    getData();
  }

  Future<void> getData() async {
    listProducts.clear();
    listProducts.value = await getSellsByClientReport2();
  }

  Future<void> getClients() async {
    clients.clear();
    clients.value = await getClientsRepo();
    selectedClient.value = clients[0];
  }

  Future<List<SellsByClientReporte2Model>> getSellsByClientReport2() async {
    List<SellsByClientReporte2Model> listProducts = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      Database db = await sqliteService.openDB('Database.db');

      String statement = '''
SELECT 
    c.idCliente,
    cl.nombreUno AS nombreCliente,
    cl.apellidoUno AS apellidoCliente,
    c.fecha AS fechaCompra,
    p.nombre AS producto,
    dc.cantidad,
    dc.precioUnitario
FROM 
    Compra c
JOIN 
    Cliente cl ON c.idCliente = cl.idCliente
JOIN 
    DetalleCompra dc ON c.idCompra = dc.idCompra
JOIN 
    Producto p ON dc.idProducto = p.idProducto
WHERE 
    cl.nombreUno = '${selectedClient.value}' 
ORDER BY 
    c.fecha;
      ''';

      List<Map> list = await db.rawQuery(statement);
      listProducts = List<SellsByClientReporte2Model>.from(
          list.map((x) => SellsByClientReporte2Model.fromJson(x)));
      return listProducts;
    } catch (e) {
      Get.printError(info: "$e");
      return [];
    }
  }

  @override
  Future<List<String>> getClientsRepo() async {
    List<String> listClients = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      Database db = await sqliteService.openDB('Database.db');

      String statement = '''
     SELECT DISTINCT
    nombreUno AS cliente
FROM 
    Cliente
      ''';

      List<Map> list = await db.rawQuery(statement);
      listClients = List<String>.from(list.map((x) => x['cliente']));
      return listClients;
    } catch (e) {
      Get.printError(info: "$e");
      return [];
    }
  }

  static SellsByClientReport2ViewModel get findOrInitialize {
    try {
      return Get.find<SellsByClientReport2ViewModel>();
    } catch (e) {
      Get.put(SellsByClientReport2ViewModel());
      return Get.find<SellsByClientReport2ViewModel>();
    }
  }
}
