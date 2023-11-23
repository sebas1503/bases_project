import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:software2/shared/widgets/custom_alert_widget.dart';
import 'package:software2/shared/widgets/custom_app_bar.dart';
import 'package:software2/shared/widgets/custom_button.dart';
import 'package:software2/shared/widgets/custom_text_field.dart';
import 'package:software2/shared/widgets/separator.dart';

import '../../../../../shared/widgets/custom_alert.dart';

import '../../../../domain/empleado_module/register_empleado/model/empleado_model.dart';
import '../view_model/edit_empleado_vm.dart';
import '../widgets/edit_empleado.dart';

class EditEmpleadoPage extends StatelessWidget {
  EditEmpleadoPage({super.key});
  final editEmpleadosViewModel = EditEmpleadoViewModel.findOrInitialize;

  final Debouncer onSearchDebouncer =
      Debouncer(delay: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    editEmpleadosViewModel.getEmpleados();
    return Scaffold(
      appBar: const CustomAppBar(title: ' Gestionar Empleado', isBack: true),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, top: 8.0, bottom: 8, right: 15),
        child: Column(
          children: [
            const Separator(size: 2),
            CustomTextField(
              textEditingController: editEmpleadosViewModel.searchController,
              labelText: 'Buscar',
              height: Get.height * 0.08,
              onChanged: (_) {
                onSearchDebouncer(
                    () async => await editEmpleadosViewModel.getEmpleados());
              },
            ),
            const Separator(size: 4),
            Obx(() => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: DataTable(
                      headingRowColor: MaterialStateColor.resolveWith(
                        (states) => ConstColors.principalColor,
                      ),
                      showCheckboxColumn: true,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      border: TableBorder(
                        horizontalInside: const BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        verticalInside: const BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      columns: const [
                        DataColumn(label: Center(child: Text('Modificar'))),
                        DataColumn(label: Center(child: Text('Cedula'))),
                        DataColumn(label: Center(child: Text('Primer Nombre'))),
                        DataColumn(
                            label: Center(child: Text('Segundo Nombre'))),
                        DataColumn(
                            label: Center(child: Text('Primer Apellido'))),
                        DataColumn(
                            label: Center(child: Text('Segundo Apellido'))),
                      ],
                      rows: editEmpleadosViewModel.requestList
                          .map(
                            (entry) => DataRow(
                              cells: <DataCell>[
                                DataCell(Center(
                                    child: IconButton(
                                        onPressed: () {
                                          CustomAlertWidget(
                                            title: 'Elige una opcion',
                                            body: _contentAlert(entry),
                                          );
                                        },
                                        icon: const Icon(Icons.edit)))),
                                DataCell(Center(
                                    child: Text(entry.idEmpleado!.toString()))),
                                DataCell(Center(child: Text(entry.nombreUno!))),
                                DataCell(Center(child: Text(entry.nombreDos!))),
                                DataCell(
                                    Center(child: Text(entry.apellidoUno!))),
                                DataCell(
                                    Center(child: Text(entry.apellidoDos!))),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _contentAlert(Empleado empleado) {
    return Column(
      children: [
        CustomButton(
          onPressed: () {
            editEmpleadosViewModel.setClient(empleado);
            Get.close(1);
            Get.to(() => EditClient());
          },
          text: 'Editar',
          width: Get.width * 0.5,
          backgroundColor: ConstColors.principalColor,
          rightIcon: Icon(Icons.edit, color: ConstColors.white),
        ),
        const Separator(size: 2),
        CustomButton(
          onPressed: () async {
            Get.close(1);
            var response = await editEmpleadosViewModel.deleteEmpleado(
                id: empleado.idEmpleado!.toString());
            if (response) {
              await editEmpleadosViewModel.getEmpleados();
              CustomAlert(
                title: 'Exito',
                body: 'Usuario eliminado correctamente',
                onPressed: () => Get.close(1),
              );
            }
          },
          text: 'Eliminar',
          width: Get.width * 0.5,
          backgroundColor: ConstColors.principalColor,
          rightIcon:
              Icon(Icons.delete_forever_outlined, color: ConstColors.white),
        )
      ],
    );
  }
}
