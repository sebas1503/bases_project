import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:software2/shared/widgets/custom_app_bar.dart';
import 'package:software2/shared/widgets/separator.dart';

import '../view_model/sells_by_client_report2_vm.dart';

class SellsByClientReport2Page extends StatelessWidget {
  SellsByClientReport2Page({super.key});

  final viewModel = SellsByClientReport2ViewModel.findOrInitialize;

  final Debouncer onSearchDebouncer =
      Debouncer(delay: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ventas por cliente', isBack: true),
      body: Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 8.0, bottom: 8, right: 15),
          child: Column(children: [
            const Separator(size: 2),
            Obx(() {
              return DropdownButton<String>(
                hint: const Text("Selecciona un cliente"),
                value: viewModel.selectedClient.value.isEmpty
                    ? null
                    : viewModel.selectedClient.value,
                onChanged: (newValue) {
                  viewModel.selectedClient.value = newValue!;
                  viewModel.getData();
                },
                items: viewModel.clients.map((nombreUno) {
                  return DropdownMenuItem<String>(
                    value: nombreUno,
                    child: Text(nombreUno),
                  );
                }).toList(),
              );
            }),
            const Separator(size: 2),
            Obx(() => viewModel.listProducts.isNotEmpty
                ? tableProductsSellsByClient()
                : const Padding(
                    padding: EdgeInsets.only(top: 80.0, left: 10, right: 10),
                    child: Center(
                        child: Text(
                      'No hay ventas con este cliente',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    )),
                  )),
            const Separator(size: 2),
          ])),
    );
  }

  Widget tableProductsSellsByClient() {
    return Obx(() => SingleChildScrollView(
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
                DataColumn(label: Center(child: Text('Cod. Cliente'))),
                DataColumn(label: Center(child: Text('Cliente'))),
                DataColumn(label: Center(child: Text('Fecha Compra'))),
                DataColumn(label: Center(child: Text('Producto'))),
                DataColumn(label: Center(child: Text('Cantidad'))),
                DataColumn(label: Center(child: Text('Precio Unitario'))),
              ],
              rows: viewModel.listProducts
                  .map(
                    (entry) => DataRow(
                      cells: <DataCell>[
                        DataCell(
                            Center(child: Text(entry.idCliente!.toString()))),
                        DataCell(Center(
                            child: Text(
                                '${entry.nombreCliente!} ${entry.apellidoCliente!}'))),
                        DataCell(Center(child: Text(entry.fechaCompra!))),
                        DataCell(Center(child: Text(entry.producto!))),
                        DataCell(
                            Center(child: Text(entry.cantidad!.toString()))),
                        DataCell(Center(
                            child: Text(entry.precioUnitario!.toString()))),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ));
  }
}
