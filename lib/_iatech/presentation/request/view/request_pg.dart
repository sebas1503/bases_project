import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:software2/_iatech/domain/register/model/aspirante_model.dart';
import 'package:software2/_iatech/presentation/request/view_model/request_vm.dart';
import 'package:software2/_iatech/presentation/request/widgets/edit_user.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:software2/shared/widgets/custom_alert_widget.dart';
import 'package:software2/shared/widgets/custom_app_bar.dart';
import 'package:software2/shared/widgets/custom_button.dart';
import 'package:software2/shared/widgets/custom_text_field.dart';
import 'package:software2/shared/widgets/separator.dart';

class RequestPage extends StatelessWidget {
  RequestPage({super.key});
  final requestViewModel = RequestViewModel.findOrInitialize;

  final Debouncer onSearchDebouncer =
      Debouncer(delay: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    requestViewModel.getRequest();
    return Scaffold(
      appBar: const CustomAppBar(title: ' Gestionar Solicitudes', isBack: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Separator(size: 2),
            CustomTextField(
              textEditingController: requestViewModel.searchController,
              labelText: 'Buscar',
              height: Get.height * 0.08,
              onChanged: (_) {
                onSearchDebouncer(
                    () async => await requestViewModel.getRequest());
              },
            ),
            const Separator(size: 2),
            Obx(() => RawScrollbar(
                  scrollbarOrientation: ScrollbarOrientation.top,
                  interactive: true,
                  trackVisibility: true,
                  thumbVisibility: true,
                  thumbColor: ConstColors.principalBlue,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      showCheckboxColumn: true,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
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
                        DataColumn(label: Center(child: Text('Nombre'))),
                        DataColumn(label: Center(child: Text('Apellido'))),
                        DataColumn(label: Center(child: Text('Cedula'))),
                        DataColumn(
                            label: Center(child: Text('Fecha de Nacimiento'))),
                        DataColumn(label: Center(child: Text('Email'))),
                        DataColumn(label: Center(child: Text('Telefono'))),
                        DataColumn(label: Center(child: Text('Direccion'))),
                        DataColumn(label: Center(child: Text('Ciudad'))),
                        DataColumn(label: Center(child: Text('Cargo'))),
                        DataColumn(
                            label: Center(child: Text('Aspiracion Salarial'))),
                        DataColumn(
                            label: Center(child: Text('Nivel de Estudios'))),
                      ],
                      rows: requestViewModel.requestList
                          .map(
                            (entry) => DataRow(
                              cells: <DataCell>[
                                DataCell(Center(
                                    child: IconButton(
                                        onPressed: () {
                                          CustomAlertWidget(
                                            title: 'Que deseas hacer hoy?',
                                            body: _contentAlert(entry),
                                          );
                                        },
                                        icon: const Icon(Icons.edit)))),
                                DataCell(Center(child: Text(entry.nombre!))),
                                DataCell(Center(child: Text(entry.apellido!))),
                                DataCell(Center(child: Text(entry.cedula!))),
                                DataCell(Center(
                                    child: Text(entry.fechaNacimiento!))),
                                DataCell(Center(child: Text(entry.email!))),
                                DataCell(Center(child: Text(entry.telefono!))),
                                DataCell(Center(child: Text(entry.direccion!))),
                                DataCell(Center(child: Text(entry.ciudad!))),
                                DataCell(Center(child: Text(entry.cargo!))),
                                DataCell(Center(
                                    child: Text(entry.salario.toString()))),
                                DataCell(
                                    Center(child: Text(entry.nivelEstudios!))),
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

  Widget _contentAlert(Candidate candidate) {
    return Column(
      children: [
        CustomButton(
          onPressed: () {
            requestViewModel.setCandidate(candidate);
            Get.close(1);
            Get.to(() => EditUser());
          },
          text: 'Editar',
          width: Get.width * 0.5,
          backgroundColor: ConstColors.principalBlue,
          rightIcon: Icon(Icons.edit, color: ConstColors.white),
        ),
        CustomButton(
          onPressed: () async {
            await requestViewModel.deletedRequest(id: candidate.cedula!);
          },
          text: 'Eliminar',
          width: Get.width * 0.5,
          backgroundColor: ConstColors.principalBlue,
          rightIcon:
              Icon(Icons.delete_forever_outlined, color: ConstColors.white),
        )
      ],
    );
  }
}
