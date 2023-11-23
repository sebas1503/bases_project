import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/papeleria/domain/client_module/register_client/model/client_model.dart';
import 'package:software2/papeleria/infraestructure/client_module/register_client/register_client_repository.dart';

import '../../../../domain/client_module/register_client/service/register_client_service.dart';

class RegisterClientViewModel extends GetxController {
  final RegisterClientService registerService =
      RegisterClientService(iRegisterClient: RegisterRepository());
  //
  TextEditingController idController = TextEditingController();
  TextEditingController nameOneController = TextEditingController();
  TextEditingController nameTwoController = TextEditingController();
  TextEditingController lastNameOneController = TextEditingController();
  TextEditingController lastNameTwoController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future<bool> registerClient() async {
    Client client = Client(
      idClient: int.parse(idController.text),
      nombreUno: nameOneController.text,
      nombreDos: nameTwoController.text,
      apellidoUno: lastNameOneController.text,
      apellidoDos: lastNameTwoController.text,
      direccion: addressController.text,
    );

    bool result = await registerService.registerClient(client);

    return result;
  }

  static RegisterClientViewModel get findOrInitialize {
    try {
      return Get.find<RegisterClientViewModel>();
    } catch (e) {
      Get.put(RegisterClientViewModel());
      return Get.find<RegisterClientViewModel>();
    }
  }
}
