import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/papeleria/domain/proveedor_module/register_proveedor/model/proveedor_model.dart';
import 'package:software2/papeleria/domain/proveedor_module/register_proveedor/service/register_proveedor_service.dart';
import 'package:software2/papeleria/infraestructure/proveedor_module/register_proveedor/register_proveedor_repository.dart';

class RegisterProveedorViewModel extends GetxController {
  final RegisterProveedorService registerProveedorService =
      RegisterProveedorService(
          iRegisterProveedor: RegisterProveedorRepository());

  TextEditingController idController = TextEditingController();
  TextEditingController nameOneController = TextEditingController();
  TextEditingController nameTwoController = TextEditingController();
  TextEditingController lastNameOneController = TextEditingController();
  TextEditingController lastNameTwoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController businessController = TextEditingController();

  Future<bool> registerProveedor() async {
    Proveedor proveedor = Proveedor(
      idProveedor: int.parse(idController.text),
      nombreUno: nameOneController.text,
      nombreDos: nameTwoController.text,
      apellidoUno: lastNameOneController.text,
      apellidoDos: lastNameTwoController.text,
      direccion: addressController.text,
      idEmpresa: int.parse(businessController.text),
    );

    bool result = await registerProveedorService.registerProveedor(proveedor);

    return result;
  }

  static RegisterProveedorViewModel get findOrInitialize {
    try {
      return Get.find<RegisterProveedorViewModel>();
    } catch (e) {
      Get.put(RegisterProveedorViewModel());
      return Get.find<RegisterProveedorViewModel>();
    }
  }
}
