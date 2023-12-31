import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:software2/papeleria/presentation/home/view_model/home_vm.dart';
import 'package:software2/shared/widgets/custom_app_bar.dart';

import '../../../../shared/widgets/drawer_general.dart';
import '../../../../shared/widgets/separator.dart';
import '../model/category_by_sell_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final loginViewModel = HomeViewModel.findOrInitialize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loginViewModel.getSellsByClientReport2();
      await loginViewModel.getSellsByClient();
      await loginViewModel.getSellsByEmpleado();
    });
  }

  @override
  Widget build(BuildContext context) {
    loginViewModel.fullOptions();
    loginViewModel.getSellsByClientReport2();
    return Scaffold(
        endDrawer: DrawerGeneral(),
        appBar: const CustomAppBar(title: 'Bienvenido!', isBack: false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              categoriesBySells(),
              sellsByClientWg(),
              sellsByEmpleadoWg(),
            ],
          ),
        ));
  }

  Widget categoriesBySells() {
    return Column(
      children: [
        const Separator(
          size: 2,
        ),
        const Center(
          child: Text('Estadisticas venta por categoria'),
        ),
        //Crear grafica de barras con loginViewModel.listCategories
        const Separator(
          size: 3,
        ),
        SizedBox(
            height: Get.height * 0.5,
            child: Obx(
              () => BarChart(BarChartData(
                barGroups: loginViewModel.listCategory.map((category) {
                  return BarChartGroupData(
                    x: category.idCategoriaProducto ?? 0,
                    barRods: [
                      BarChartRodData(
                        toY: category.numeroDeVentas?.toDouble() ?? 0,
                        // Configura otros parámetros del bar rod
                      ),
                    ],
                  );
                }).toList(),
                // Configura otros parámetros según tus necesidades
              )),
            )),
        const Separator(
          size: 3,
        ),
        Obx(() => SizedBox(
              height: Get.height * 0.2,
              child: ListView.builder(
                  itemCount: loginViewModel.listCategory.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        // const Separator(size: 1),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Categoria:',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${loginViewModel.listCategory[index].categoria}',
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black54),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Codigo Categoria:',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    loginViewModel
                                        .listCategory[index].idCategoriaProducto
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ))
      ],
    );
  }

  Widget sellsByClientWg() {
    return Column(
      children: [
        const Separator(
          size: 2,
        ),
        const Center(
          child: Text('Estadisticas Ventas por cliente'),
        ),
        //Crear grafica de barras con loginViewModel.listCategories
        const Separator(
          size: 3,
        ),
        SizedBox(
            height: Get.height * 0.5,
            child: Obx(
              () => BarChart(BarChartData(
                barGroups: loginViewModel.listSellsByClient.map((sell) {
                  return BarChartGroupData(
                    x: sell.idCliente ?? 0,
                    barRods: [
                      BarChartRodData(
                        color: Colors.green,
                        toY: sell.numeroDeVentas?.toDouble() ?? 0,
                        // Configura otros parámetros del bar rod
                      ),
                    ],
                  );
                }).toList(),
                // Configura otros parámetros según tus necesidades
              )),
            )),
        const Separator(
          size: 3,
        ),
        Obx(() => SizedBox(
              height: Get.height * 0.2,
              child: ListView.builder(
                  itemCount: loginViewModel.listSellsByClient.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        // const Separator(size: 1),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Cliente:',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${loginViewModel.listSellsByClient[index].nombreCliente}',
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black54),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Codigo Cliente:',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    loginViewModel
                                        .listSellsByClient[index].idCliente
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ))
      ],
    );
  }

  Widget sellsByEmpleadoWg() {
    return Column(
      children: [
        const Separator(
          size: 2,
        ),
        const Center(
          child: Text('Estadisticas Ventas por empleado'),
        ),
        //Crear grafica de barras con loginViewModel.listCategories
        const Separator(
          size: 3,
        ),
        SizedBox(
            height: Get.height * 0.5,
            child: Obx(
              () => BarChart(BarChartData(
                barGroups: loginViewModel.listSellsByEmpleado.map((sell) {
                  return BarChartGroupData(
                    x: sell.idEmpleado ?? 0,
                    barRods: [
                      BarChartRodData(
                        color: Colors.brown,
                        toY: sell.numeroDeVentas?.toDouble() ?? 0,
                        // Configura otros parámetros del bar rod
                      ),
                    ],
                  );
                }).toList(),
                // Configura otros parámetros según tus necesidades
              )),
            )),
        const Separator(
          size: 3,
        ),
        Obx(() => SizedBox(
              height: Get.height * 0.2,
              child: ListView.builder(
                  itemCount: loginViewModel.listSellsByEmpleado.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        // const Separator(size: 1),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Cliente:',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${loginViewModel.listSellsByEmpleado[index].nombreEmpleado}',
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black54),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Codigo Cliente:',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    loginViewModel
                                        .listSellsByEmpleado[index].idEmpleado
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ))
      ],
    );
  }
}
