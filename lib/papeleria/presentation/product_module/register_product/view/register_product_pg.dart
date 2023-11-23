import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:software2/shared/widgets/custom_alert.dart';
import 'package:software2/shared/widgets/custom_app_bar.dart';
import 'package:software2/shared/widgets/custom_button.dart';
import 'package:software2/shared/widgets/custom_text_field.dart';
import 'package:software2/shared/widgets/separator.dart';

import '../view_model/register_product_vm.dart';

DateTime _selectedDate = DateTime.now();

class RegisterProductPage extends StatelessWidget {
  RegisterProductPage({super.key});

  final registerProductViewModel = RegisterProductViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Registrar Empleado', isBack: true),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Separator(size: 2),
                CustomTextField(
                  textEditingController:
                      registerProductViewModel.idProductController,
                  labelText: 'Cod. Producto *',
                  keyboardType: TextInputType.number,
                ),
                const Separator(size: 2),
                CustomTextField(
                    textEditingController:
                        registerProductViewModel.nameController,
                    labelText: 'Nombre *'),
                const Separator(size: 2),
                CustomTextField(
                    textEditingController:
                        registerProductViewModel.descriptionController,
                    labelText: 'Descripcion *'),
                const Separator(size: 2),
                CustomTextField(
                  textEditingController:
                      registerProductViewModel.priceController,
                  labelText: 'Precio *',
                ),
                const Separator(size: 2),
                CustomTextField(
                  textEditingController:
                      registerProductViewModel.categoryController,
                  labelText: 'Cod. Categoria *',
                ),
                const Separator(size: 2),
                // CustomTextField(
                //   textEditingController: registerViewModel.addressController,
                //   labelText: 'Direccion',
                // ),
                const Separator(size: 4),
                CustomButton(
                    width: Get.width,
                    onPressed: () async {
                      if (registerProductViewModel
                              .idProductController.text.isEmpty ||
                          registerProductViewModel
                              .nameController.text.isEmpty ||
                          registerProductViewModel
                              .descriptionController.text.isEmpty ||
                          registerProductViewModel
                              .priceController.text.isEmpty ||
                          registerProductViewModel
                              .categoryController.text.isEmpty) {
                        CustomAlert(
                            title: 'Campos vacios',
                            body: 'Por favor llene los campos obligatorios',
                            onPressed: () {
                              Get.back();
                            });
                        return;
                      } else {
                        bool response =
                            await registerProductViewModel.registerEmpleado();
                        if (response) {
                          CustomAlert(
                              title: 'Registro exitoso',
                              body:
                                  'El producto se ha registrado correctamente',
                              onPressed: () {
                                Get.close(2);
                              });
                        }
                      }
                    },
                    text: 'Registrar',
                    backgroundColor: ConstColors.principalColor)
              ],
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
