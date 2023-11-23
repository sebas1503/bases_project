import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:software2/papeleria/presentation/report1_products_by_category/view_model/products_by_category_report1_vm.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:software2/shared/widgets/custom_app_bar.dart';
import 'package:software2/shared/widgets/separator.dart';

class ProductsByCategoryReport1Page extends StatelessWidget {
  ProductsByCategoryReport1Page({super.key});

  final viewModel = ProductsByCategoryReport1ViewModel.findOrInitialize;

  final Debouncer onSearchDebouncer =
      Debouncer(delay: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const CustomAppBar(title: 'Productos por categoria', isBack: true),
      body: Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 8.0, bottom: 8, right: 15),
          child: Column(children: [
            const Separator(size: 2),
            Obx(() {
              return DropdownButton<String>(
                hint: Text("Selecciona una categoría"),
                value: viewModel.selectedCategory.value.isEmpty
                    ? null
                    : viewModel.selectedCategory.value,
                onChanged: (newValue) {
                  viewModel.selectedCategory.value = newValue!;
                  viewModel.getProductsByCategory();
                },
                items: viewModel.categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
              );
            }),
            const Separator(size: 2),
            Obx(() => viewModel.listProducts.isNotEmpty
                ? tableProductsByCategory()
                : const Padding(
                    padding: EdgeInsets.only(top: 80.0, left: 10, right: 10),
                    child: Center(
                        child: Text(
                      'No hay productos registrados con la categoria seleccionada',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    )),
                  )),
            const Separator(size: 2),
          ])),
    );
  }

  Widget tableProductsByCategory() {
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
                DataColumn(label: Center(child: Text('Nombre Producto'))),
                DataColumn(label: Center(child: Text('Descripcion'))),
                DataColumn(label: Center(child: Text('Categoria'))),
                DataColumn(label: Center(child: Text('Precio'))),
              ],
              rows: viewModel.listProducts
                  .map(
                    (entry) => DataRow(
                      cells: <DataCell>[
                        DataCell(Center(child: Text(entry.nombreProducto!))),
                        DataCell(Center(child: Text(entry.descripcion!))),
                        DataCell(
                            Center(child: Text(entry.categoria!.toString()))),
                        DataCell(Center(child: Text(entry.precio!.toString()))),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ));
  }
}
