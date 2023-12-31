import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/papeleria/presentation/client_module/register_client/view/register_client_pg.dart';
import 'package:software2/papeleria/presentation/empleado_module/edit_empleado/view/edit_empleado_pg.dart';
import 'package:software2/papeleria/presentation/empleado_module/register_empleado/view/register_empleado_pg.dart';
import 'package:software2/papeleria/presentation/product_module/edit_product/view/edit_product_pg.dart';
import 'package:software2/papeleria/presentation/product_module/register_product/view/register_product_pg.dart';
import 'package:software2/papeleria/presentation/report1_products_by_category/view/products_by_category_report1_pg.dart';
import 'package:software2/papeleria/presentation/report1_products_by_sells_diaries/view/products_by_sells_diaries_report1_pg.dart';
import 'package:software2/papeleria/presentation/report2_months_comparative/view/comparative_months_report2_pg.dart';

import '../../papeleria/presentation/client_module/edit_client/view/edit_client_pg.dart';
import '../../papeleria/presentation/proveedor_module/edit_proveedor/view/edit_proveedor_pg.dart';
import '../../papeleria/presentation/proveedor_module/register_proveedor/view/register_proveedor_pg.dart';
import '../../papeleria/presentation/report1_products_in_inventory/view/products_in_inventory_report1_pg.dart';
import '../../papeleria/presentation/report2_products_by_client/view/sells_by_client_report2_pg.dart';
import '../assets/assets.dart';
import '../colors/colors.dart';

class DrawerGeneral extends StatefulWidget {
  DrawerGeneral({Key? key}) : super(key: key);

  @override
  State<DrawerGeneral> createState() => _DrawerGeneralState();
}

class _DrawerGeneralState extends State<DrawerGeneral> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: ConstColors.principalColor,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: ConstColors.principalColor,
                  image: DecorationImage(
                    image: AssetImage(Res.images.references),
                  )),
            ),
          ),
          ListTile(
            title: ExpansionTile(
              //collapsedIconColor: ConstColors.principalColor,
              leading: const Icon(Icons.home_work),
              title: const Text(
                'Cliente',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.start,
              ),
              children: [
                const Divider(),
                Visibility(
                  visible: true,
                  child: ListTile(
                    title: const Text(
                      'Registrar Cliente',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      Get.to(() => RegisterClientPage());
                    },
                    leading: const Icon(Icons.person_add_sharp),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: ListTile(
                    title: const Text(
                      'Ver Cliente',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      Get.to(() => EditClientPage());
                    },
                    leading: const Icon(
                      Icons.check_box_outlined,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: ExpansionTile(
              //collapsedIconColor: ConstColors.principalColor,
              leading: const Icon(Icons.home_work),
              title: const Text(
                'Proveedor',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.start,
              ),
              children: [
                const Divider(),
                Visibility(
                  visible: true,
                  child: ListTile(
                    title: const Text(
                      'Registrar Proveedor',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      Get.to(() => RegisterProveedorPage());
                    },
                    leading: const Icon(Icons.person_add_sharp),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: ListTile(
                    title: const Text(
                      'Ver Proveedor',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      Get.to(() => EditProveedorPage());
                    },
                    leading: const Icon(
                      Icons.check_box_outlined,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: ExpansionTile(
              //collapsedIconColor: ConstColors.principalColor,
              leading: const Icon(Icons.home_work),
              title: const Text(
                'Empleado',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.start,
              ),
              children: [
                const Divider(),
                Visibility(
                  visible: true,
                  child: ListTile(
                    title: const Text(
                      'Registrar Empleado',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      Get.to(() => RegisterEmpleadoPage());
                    },
                    leading: const Icon(Icons.person_add_sharp),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: ListTile(
                    title: const Text(
                      'Ver Empleado',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      Get.to(() => EditEmpleadoPage());
                    },
                    leading: const Icon(
                      Icons.check_box_outlined,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: ExpansionTile(
              //collapsedIconColor: ConstColors.principalColor,
              leading: const Icon(Icons.home_work),
              title: const Text(
                'Productos',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.start,
              ),
              children: [
                const Divider(),
                Visibility(
                  visible: true,
                  child: ListTile(
                    title: const Text(
                      'Registrar Productos',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      Get.to(() => RegisterProductPage());
                    },
                    leading: const Icon(Icons.person_add_sharp),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: ListTile(
                    title: const Text(
                      'Ver Productos',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      Get.to(() => EditProductPage());
                    },
                    leading: const Icon(
                      Icons.check_box_outlined,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: ExpansionTile(
              //collapsedIconColor: ConstColors.principalColor,
              leading: const Icon(Icons.home_work),
              title: const Text(
                'Reportes Simples',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.start,
              ),
              children: [
                const Divider(),
                Visibility(
                  visible: true,
                  child: ListTile(
                    title: const Text(
                      'Productos por categoria',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      Get.to(() => ProductsByCategoryReport1Page());
                    },
                    leading: const Icon(Icons.person_add_sharp),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: ListTile(
                    title: const Text(
                      'Productos por Ventas Diarias',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      Get.to(() => ProductsBySellsDiariesReport1Page());
                    },
                    leading: const Icon(Icons.person_add_sharp),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: ListTile(
                    title: const Text(
                      'Inventario Total',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      Get.to(() => ProductsInInventoryReport1Page());
                    },
                    leading: const Icon(Icons.person_add_sharp),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: ExpansionTile(
              //collapsedIconColor: ConstColors.principalColor,
              leading: const Icon(Icons.home_work),
              title: const Text(
                'Reportes Intermedios',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.start,
              ),
              children: [
                const Divider(),
                Visibility(
                  visible: true,
                  child: ListTile(
                    title: const Text(
                      'Ventas por cliente',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      Get.to(() => SellsByClientReport2Page());
                    },
                    leading: const Icon(Icons.person_add_sharp),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: ListTile(
                    title: const Text(
                      'Comparativa meses',
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {
                      Get.to(() => ComparativeMonthsReport2Page());
                    },
                    leading: const Icon(Icons.person_add_sharp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
