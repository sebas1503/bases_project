import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:software2/papeleria/domain/product_module/register_product/model/product_model.dart';
import 'package:software2/papeleria/presentation/product_module/edit_product/widgets/edit_product_wg.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:software2/shared/widgets/custom_alert_widget.dart';
import 'package:software2/shared/widgets/custom_app_bar.dart';
import 'package:software2/shared/widgets/custom_button.dart';
import 'package:software2/shared/widgets/custom_text_field.dart';
import 'package:software2/shared/widgets/separator.dart';
import '../../../../../shared/widgets/custom_alert.dart';
import '../view_model/edit_product_vm.dart';

class EditProductPage extends StatelessWidget {
  EditProductPage({super.key});
  final editProductsViewModel = EditProductViewModel.findOrInitialize;

  final Debouncer onSearchDebouncer =
      Debouncer(delay: const Duration(milliseconds: 500));

  @override
  Widget build(BuildContext context) {
    editProductsViewModel.getProducts();
    return Scaffold(
      appBar: const CustomAppBar(title: ' Gestionar Productos', isBack: true),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, top: 8.0, bottom: 8, right: 15),
        child: Column(
          children: [
            const Separator(size: 2),
            CustomTextField(
              textEditingController: editProductsViewModel.searchController,
              labelText: 'Buscar',
              height: Get.height * 0.08,
              onChanged: (_) {
                onSearchDebouncer(
                    () async => await editProductsViewModel.getProducts());
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
                        DataColumn(label: Center(child: Text('Código'))),
                        DataColumn(label: Center(child: Text('Nombre'))),
                        DataColumn(label: Center(child: Text('Descripción'))),
                        DataColumn(label: Center(child: Text('Precio'))),
                        DataColumn(
                            label: Center(child: Text('Cod. Categoria'))),
                      ],
                      rows: editProductsViewModel.requestList
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
                                    child: Text(entry.idProduct!.toString()))),
                                DataCell(Center(child: Text(entry.nombre!))),
                                DataCell(
                                    Center(child: Text(entry.descripcion!))),
                                DataCell(Center(
                                    child: Text(entry.precio!.toString()))),
                                DataCell(Center(
                                    child: Text(entry.categoria!.toString()))),
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

  Widget _contentAlert(Product product) {
    return Column(
      children: [
        CustomButton(
          onPressed: () {
            editProductsViewModel.setProduct(product);
            Get.close(1);
            Get.to(() => EditProductWg());
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
            var response = await editProductsViewModel.deleteProduct(
                id: product.idProduct!.toString());
            if (response) {
              await editProductsViewModel.getProducts();
              CustomAlert(
                title: 'Exito',
                body: 'Producto eliminado correctamente',
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
