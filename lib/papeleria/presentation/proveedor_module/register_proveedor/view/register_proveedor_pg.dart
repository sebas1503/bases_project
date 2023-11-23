import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/papeleria/presentation/proveedor_module/register_proveedor/view_model/register_proveedor_vm.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:software2/shared/widgets/custom_alert.dart';
import 'package:software2/shared/widgets/custom_app_bar.dart';
import 'package:software2/shared/widgets/custom_button.dart';
import 'package:software2/shared/widgets/custom_text_field.dart';
import 'package:software2/shared/widgets/separator.dart';

DateTime _selectedDate = DateTime.now();

class RegisterProveedorPage extends StatelessWidget {
  RegisterProveedorPage({super.key});

  final registerViewModel = RegisterProveedorViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Registrar Probeedor', isBack: true),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Separator(size: 2),
                CustomTextField(
                  textEditingController: registerViewModel.idController,
                  labelText: 'Cedula *',
                  keyboardType: TextInputType.number,
                ),
                const Separator(size: 2),
                CustomTextField(
                    textEditingController: registerViewModel.nameOneController,
                    labelText: 'Primer Nombre *'),
                const Separator(size: 2),
                CustomTextField(
                    textEditingController: registerViewModel.nameTwoController,
                    labelText: 'Segundo Nombre'),
                const Separator(size: 2),
                CustomTextField(
                  textEditingController:
                      registerViewModel.lastNameOneController,
                  labelText: 'Primer Apellido *',
                ),
                const Separator(size: 2),
                CustomTextField(
                  textEditingController:
                      registerViewModel.lastNameTwoController,
                  labelText: 'Segundo Apellido *',
                ),
                const Separator(size: 2),
                CustomTextField(
                  textEditingController: registerViewModel.businessController,
                  labelText: 'Cod. Empresa',
                ),
                const Separator(size: 6),
                CustomButton(
                    width: Get.width,
                    onPressed: () async {
                      if (registerViewModel.idController.text.isEmpty ||
                          registerViewModel.nameOneController.text.isEmpty ||
                          registerViewModel
                              .lastNameOneController.text.isEmpty ||
                          registerViewModel
                              .lastNameTwoController.text.isEmpty ||
                          registerViewModel.businessController.text.isEmpty) {
                        CustomAlert(
                            title: 'Campos vacios',
                            body: 'Por favor llene los campos obligatorios',
                            onPressed: () {
                              Get.back();
                            });
                        return;
                      } else {
                        bool response =
                            await registerViewModel.registerProveedor();
                        if (response) {
                          CustomAlert(
                              title: 'Registro exitoso',
                              body:
                                  'El Proveedor se ha registrado correctamente',
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
