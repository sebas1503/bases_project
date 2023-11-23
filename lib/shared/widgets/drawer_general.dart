import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/papeleria/presentation/client_module/register_client/view/register_client_pg.dart';
import 'package:software2/papeleria/presentation/empleado_module/edit_empleado/view/edit_empleado_pg.dart';
import 'package:software2/papeleria/presentation/empleado_module/register_empleado/view/register_empleado_pg.dart';

import '../../papeleria/presentation/client_module/edit_client/view/edit_client_pg.dart';
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
            title: const Text(
              'Module 1',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.start,
            ),
            onTap: () {
              Get.snackbar('Modulo en Construccion', 'Pronto estara disponible',
                  backgroundColor: ConstColors.primaryColor,
                  duration: 3.seconds);
            },
            leading: Icon(Icons.person_add_sharp),
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
        ],
      ),
    );
  }
}
