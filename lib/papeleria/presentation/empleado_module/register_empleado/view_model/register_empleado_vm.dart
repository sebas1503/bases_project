import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/empleado_module/register_empleado/model/empleado_model.dart';
import '../../../../domain/empleado_module/register_empleado/service/register_empleado_service.dart';
import '../../../../infraestructure/empleado_module/register_empleado/register_empleado_repository.dart';

class RegisterEmpleadoViewModel extends GetxController {
  final RegisterEmpleadoService registerEmpleadoService =
      RegisterEmpleadoService(iRegisterEmpleado: RegisterEmpleadoRepository());

  TextEditingController idController = TextEditingController();
  TextEditingController nameOneController = TextEditingController();
  TextEditingController nameTwoController = TextEditingController();
  TextEditingController lastNameOneController = TextEditingController();
  TextEditingController lastNameTwoController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future<bool> registerEmpleado() async {
    Empleado empleado = Empleado(
      idEmpleado: int.parse(idController.text),
      nombreUno: nameOneController.text,
      nombreDos: nameTwoController.text,
      apellidoUno: lastNameOneController.text,
      apellidoDos: lastNameTwoController.text,
      direccion: addressController.text,
    );

    bool result = await registerEmpleadoService.registerEmpleado(empleado);

    return result;
  }

  static RegisterEmpleadoViewModel get findOrInitialize {
    try {
      return Get.find<RegisterEmpleadoViewModel>();
    } catch (e) {
      Get.put(RegisterEmpleadoViewModel());
      return Get.find<RegisterEmpleadoViewModel>();
    }
  }
}
