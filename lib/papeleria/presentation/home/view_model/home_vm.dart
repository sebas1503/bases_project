import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:software2/papeleria/domain/home/models/options_model.dart';
import 'package:software2/papeleria/presentation/client_module/register_client/view/register_client_pg.dart';
import 'package:software2/shared/assets/assets.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:sqflite/sqflite.dart';

import '../../../infraestructure/data/local/sqlite/base_sqlite_service.dart';
import '../../../infraestructure/data/local/sqlite/sqlite_service.dart';
import '../model/category_by_sell_model.dart';
import '../model/sellls_by_client.dart';
import '../model/sells_by_empleado.dart';

class HomeViewModel extends GetxController {
  RxList<OptionsModel> options = <OptionsModel>[].obs;
  RxList<CategoryBySellsModel> listCategory = <CategoryBySellsModel>[].obs;
  RxList<SellsByClientModel> listSellsByClient = <SellsByClientModel>[].obs;
  RxList<SellsByEmpleadoModel> listSellsByEmpleado =
      <SellsByEmpleadoModel>[].obs;

  static HomeViewModel get findOrInitialize {
    try {
      return Get.find<HomeViewModel>();
    } catch (e) {
      Get.put(HomeViewModel());
      return Get.find<HomeViewModel>();
    }
  }

  void fullOptions() {
    options.value = [
      OptionsModel('Registrar Candidato', Res.images.addPerson, () {
        Get.to(() => RegisterClientPage());
      }),
      OptionsModel('Gestionar Solicitudes', Res.images.getRequest, () {
        // Get.to(() => RequestPage());
      }),
      OptionsModel('Programar Entrevistas', Res.images.programateDate, () {
        Get.snackbar('Modulo en Construccion', 'Pronto estara disponible',
            backgroundColor: ConstColors.primaryColor, duration: 3.seconds);
      }),
      OptionsModel('Gestionar Resultados de Entrevista', Res.images.gestResult,
          () {
        Get.snackbar('Modulo en Construccion', 'Pronto estara disponible',
            backgroundColor: ConstColors.primaryColor, duration: 3.seconds);
      }),
      OptionsModel('Gestionar Referencias', Res.images.references, () {
        Get.snackbar('Modulo en Construccion', 'Pronto estara disponible',
            backgroundColor: ConstColors.primaryColor, duration: 3.seconds);
      }),
      OptionsModel(
          'Verificar Antecedentes de Candidato', Res.images.antecedentes, () {
        Get.to(() => RegisterClientPage());
      }),
      OptionsModel('Generar oferta de empleo', Res.images.oferts, () {
        Get.snackbar('Modulo en Construccion', 'Pronto estara disponible',
            backgroundColor: ConstColors.primaryColor, duration: 3.seconds);
      }),
      OptionsModel('Gestionar Contratos', Res.images.contrato, () {
        Get.snackbar('Modulo en Construccion', 'Pronto estara disponible',
            backgroundColor: ConstColors.primaryColor, duration: 3.seconds);
      }),
    ];
  }

  Future<List<CategoryBySellsModel>> getSellsByClientReport2() async {
    List<CategoryBySellsModel> listCategories = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      Database db = await sqliteService.openDB('Database.db');

      String statement = '''
SELECT 
    cp.nombre AS categoria,
    COUNT(c.idCompra) AS numeroDeVentas,
    cp.idCategoriaProducto as idCategoriaProducto
FROM 
    CategoriaProducto cp
JOIN 
    Producto p ON cp.idCategoriaProducto = p.categoria
JOIN
    DetalleCompra dc ON p.idProducto = dc.idProducto
JOIN 
    Compra c ON dc.idCompra = c.idCompra
GROUP BY 
    cp.nombre
ORDER BY 
    NumeroDeVentas DESC
      ''';

      List<Map> list = await db.rawQuery(statement);
      listCategories = List<CategoryBySellsModel>.from(
          list.map((x) => CategoryBySellsModel.fromJson(x)));
      listCategory.value = listCategories;
      return listCategories;
    } catch (e) {
      Get.printError(info: "$e");
      return [];
    }
  }

  Future<List<SellsByClientModel>> getSellsByClient() async {
    List<SellsByClientModel> listSells = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      Database db = await sqliteService.openDB('Database.db');

      String statement = '''
SELECT 
    cl.idCliente,
    cl.nombreUno || ' ' || cl.apellidoUno AS nombreCliente,
    COUNT(c.idCompra) AS numeroDeVentas
FROM 
    Cliente cl
JOIN 
    Compra c ON cl.idCliente = c.idCliente
GROUP BY 
    cl.idCliente
ORDER BY 
    NumeroDeVentas DESC
      ''';

      List<Map> list = await db.rawQuery(statement);
      listSells = List<SellsByClientModel>.from(
          list.map((x) => SellsByClientModel.fromJson(x)));
      listSellsByClient.value = listSells;
      return listSellsByClient;
    } catch (e) {
      Get.printError(info: "$e");
      return [];
    }
  }

  Future<List<SellsByEmpleadoModel>> getSellsByEmpleado() async {
    List<SellsByEmpleadoModel> listSellsByEmple = [];
    try {
      BaseSqliteService sqliteService = SqliteService();
      Database db = await sqliteService.openDB('Database.db');

      String statement = '''
SELECT 
    e.idEmpleado,
    e.nombreUno || ' ' || e.apellidoUno AS nombreEmpleado,
    COUNT(c.idCompra) AS numeroDeVentas
FROM 
    Empleado e
JOIN 
    Compra c ON e.idEmpleado = c.idEmpleado
GROUP BY 
    e.idEmpleado
ORDER BY 
    NumeroDeVentas DESC
      ''';

      List<Map> list = await db.rawQuery(statement);
      listSellsByEmple = List<SellsByEmpleadoModel>.from(
          list.map((x) => SellsByEmpleadoModel.fromJson(x)));
      listSellsByEmpleado.value = listSellsByEmple;
      return listSellsByEmple;
    } catch (e) {
      Get.printError(info: "$e");
      return [];
    }
  }
}
