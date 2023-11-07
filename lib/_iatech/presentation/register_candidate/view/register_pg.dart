import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/_iatech/infraestructure/register/register_repository.dart';
import 'package:software2/_iatech/presentation/register_candidate/view_model/register_vm.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:software2/shared/widgets/custom_app_bar.dart';
import 'package:software2/shared/widgets/custom_button.dart';
import 'package:software2/shared/widgets/custom_text_field.dart';
import 'package:software2/shared/widgets/separator.dart';

DateTime _selectedDate = DateTime.now();

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final registerViewModel = RegisterViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Registrar Candidato', isBack: true),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Separator(size: 2),
                CustomTextField(
                    textEditingController: TextEditingController(),
                    labelText: 'Nombre(s)'),
                const Separator(size: 2),
                CustomTextField(
                    textEditingController: TextEditingController(),
                    labelText: 'Apellido(s)'),
                const Separator(size: 2),
                CustomTextField(
                  textEditingController: TextEditingController(),
                  labelText: 'Cedula',
                ),
                const Separator(size: 2),
                CustomTextField(
                  textEditingController: registerViewModel.birthDateController,
                  labelText: 'Fecha de nacimiento',
                  onTap: () {
                    _showDatePicker(
                        context, registerViewModel.birthDateController);
                  },
                  onChanged: (value) {
                    _selectedDate = DateTime.parse(value);
                  },
                ),
                const Separator(size: 2),
                CustomTextField(
                  textEditingController: TextEditingController(),
                  labelText: 'Correo Electronico',
                ),
                const Separator(size: 2),
                CustomTextField(
                  textEditingController: TextEditingController(),
                  labelText: 'Telefono',
                ),
                const Separator(size: 2),
                CustomTextField(textEditingController: TextEditingController()),
                const Separator(size: 2),
                CustomTextField(textEditingController: TextEditingController()),
                const Separator(size: 2),
                CustomTextField(textEditingController: TextEditingController()),
                const Separator(size: 2),
                CustomButton(
                    width: Get.width,
                    onPressed: () {
                      RegisterRepository().getProductsBanner();
                    },
                    text: 'Registrar',
                    backgroundColor: ConstColors.principalBlue)
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
