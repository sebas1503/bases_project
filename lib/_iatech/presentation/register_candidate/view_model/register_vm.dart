import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/_iatech/domain/register/model/aspirante_model.dart';
import 'package:software2/_iatech/domain/register/service/register_service.dart';
import 'package:software2/_iatech/infraestructure/register/register_repository.dart';

class RegisterViewModel extends GetxController {
  final RegisterService registerService =
      RegisterService(iRegister: RegisterRepository());

  //

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addresController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController levelController = TextEditingController();

  Future<bool> registerCandidate() async {
    Candidate candidate = Candidate(
      nombre: nameController.text,
      apellido: lastNameController.text,
      cedula: idController.text,
      fechaNacimiento: birthDateController.text,
      email: emailController.text,
      telefono: phoneController.text,
      direccion: addresController.text,
      ciudad: cityController.text,
      cargo: positionController.text,
      salario: double.parse(salaryController.text),
      nivelEstudios: levelController.text,
    );

    bool result = await registerService.registerUser(candidate);

    return result;
  }

  static RegisterViewModel get findOrInitialize {
    try {
      return Get.find<RegisterViewModel>();
    } catch (e) {
      Get.put(RegisterViewModel());
      return Get.find<RegisterViewModel>();
    }
  }
}
