import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:software2/shared/widgets/custom_app_bar.dart';
import 'package:software2/shared/widgets/separator.dart';

import '../view_model/comparative_months_report2_vm.dart';

class ComparativeMonthsReport2Page extends StatelessWidget {
  ComparativeMonthsReport2Page({super.key});

  final viewModel = ComparativeMonthsReport2ViewModel.findOrInitialize;

  final Debouncer onSearchDebouncer =
      Debouncer(delay: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Comparativa Meses', isBack: true),
      body: Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 8.0, bottom: 8, right: 15),
          child: Center(
            child: Column(children: [
              const Separator(size: 4),
              Obx(() => viewModel.listData.isNotEmpty
                  ? tableMonthsComparative()
                  : const Padding(
                      padding: EdgeInsets.only(top: 80.0, left: 10, right: 10),
                      child: Center(
                          child: Text(
                        'No hay informacion para mostrar',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      )),
                    )),
              const Separator(size: 2),
            ]),
          )),
    );
  }

  Widget tableMonthsComparative() {
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
                DataColumn(label: Center(child: Text('Año'))),
                DataColumn(label: Center(child: Text('Mes'))),
                DataColumn(label: Center(child: Text('Ventas Totales'))),
              ],
              rows: viewModel.listData
                  .map(
                    (entry) => DataRow(
                      cells: <DataCell>[
                        DataCell(Center(child: Text(entry.anio!.toString()))),
                        DataCell(Center(child: Text(entry.mes!.toString()))),
                        DataCell(Center(
                            child: Text(entry.ventasTotales!.toString()))),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ));
  }
}
