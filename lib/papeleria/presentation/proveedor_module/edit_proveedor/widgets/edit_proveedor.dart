import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/papeleria/presentation/proveedor_module/edit_proveedor/view_model/edit_proveedor_vm.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:software2/shared/widgets/custom_alert.dart';
import 'package:software2/shared/widgets/custom_app_bar.dart';
import 'package:software2/shared/widgets/custom_button.dart';
import 'package:software2/shared/widgets/custom_text_field.dart';
import 'package:software2/shared/widgets/separator.dart';

DateTime _selectedDate = DateTime.now();

class EditProveedor extends StatelessWidget {
  EditProveedor({super.key});

  final editProveedorViewModel = EditProveedorViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Editar Proveedor',
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
                          editProveedorViewModel.idController,
                      labelText: 'Cédula'),
                  const Separator(size: 2),
                  CustomTextField(
                      textEditingController:
                          editProveedorViewModel.nameOneController,
                      labelText: 'Primer Nombre '),
                  const Separator(size: 2),
                  CustomTextField(
                    textEditingController:
                        editProveedorViewModel.nameTwoController,
                    labelText: 'Segundo Nombre',
                    keyboardType: TextInputType.number,
                  ),
                  const Separator(size: 2),
                  CustomTextField(
                    textEditingController:
                        editProveedorViewModel.lastNameOneController,
                    labelText: 'Primer Apellido',
                    keyboardType: TextInputType.number,
                  ),
                  const Separator(size: 2),
                  CustomTextField(
                    textEditingController:
                        editProveedorViewModel.lastNameTwoController,
                    labelText: 'Segundo Apellido',
                    keyboardType: TextInputType.number,
                  ),
                  const Separator(size: 2),
                  CustomTextField(
                    textEditingController:
                        editProveedorViewModel.businessController,
                    labelText: 'Nro. Empresa',
                    keyboardType: TextInputType.number,
                  ),
                  const Separator(size: 2),
                  CustomButton(
                      width: Get.width,
                      onPressed: () async {
                        bool response =
                            await editProveedorViewModel.updateProveedor();
                        if (response) {
                          await editProveedorViewModel.getProveedor();
                          CustomAlert(
                            title: 'Exito',
                            body: 'Proveedor actualizado correctamente',
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
