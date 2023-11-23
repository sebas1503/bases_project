import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/papeleria/presentation/empleado_module/edit_empleado/view_model/edit_empleado_vm.dart';
import 'package:software2/papeleria/presentation/product_module/edit_product/view_model/edit_product_vm.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:software2/shared/widgets/custom_alert.dart';
import 'package:software2/shared/widgets/custom_app_bar.dart';
import 'package:software2/shared/widgets/custom_button.dart';
import 'package:software2/shared/widgets/custom_text_field.dart';
import 'package:software2/shared/widgets/separator.dart';

DateTime _selectedDate = DateTime.now();

class EditProductWg extends StatelessWidget {
  EditProductWg({super.key});

  final editProductViewModel = EditProductViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Editar Producto',
          isBack: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: RawScrollbar(
            thumbColor: ConstColors.principalColor,
            thumbVisibility: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Separator(size: 2),
                  CustomTextField(
                      textEditingController:
                          editProductViewModel.idProductController,
                      labelText: 'Cédula'),
                  const Separator(size: 2),
                  CustomTextField(
                      textEditingController:
                          editProductViewModel.nameController,
                      labelText: 'Nombre'),
                  const Separator(size: 2),
                  CustomTextField(
                    textEditingController:
                        editProductViewModel.descriptionController,
                    labelText: 'Descripcion',
                    keyboardType: TextInputType.number,
                  ),
                  const Separator(size: 2),
                  CustomTextField(
                    textEditingController: editProductViewModel.priceController,
                    labelText: 'Precio',
                    keyboardType: TextInputType.number,
                  ),
                  const Separator(size: 2),
                  CustomTextField(
                    textEditingController:
                        editProductViewModel.categoryController,
                    labelText: 'Cod. Categoria',
                    keyboardType: TextInputType.number,
                  ),
                  const Separator(size: 2),
                  CustomButton(
                      width: Get.width,
                      onPressed: () async {
                        bool response =
                            await editProductViewModel.updateProduct();
                        if (response) {
                          await editProductViewModel.getProducts();
                          CustomAlert(
                            title: 'Exito',
                            body: 'Producto actualizado correctamente',
                            onPressed: () => Get.close(2),
                          );
                        }
                      },
                      text: 'Editar',
                      backgroundColor: ConstColors.principalColor)
                ],
              ),
            ),
          ),
        ));
  }

  void _showDatePicker(BuildContext context, TextEditingController controller) {
    // Muestra el cuadro de diálogo del calendario
    showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime(2023, 12, 31),
    ).then((date) {
      // Actualiza la fecha seleccionada
      controller.text = date.toString().substring(0, 10);
    });
  }
}
