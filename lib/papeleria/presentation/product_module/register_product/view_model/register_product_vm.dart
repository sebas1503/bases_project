import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/papeleria/domain/product_module/register_product/model/product_model.dart';
import 'package:software2/papeleria/domain/product_module/register_product/service/register_product_service.dart';
import 'package:software2/papeleria/infraestructure/product_module/register_producto/register_product_repository.dart';

class RegisterProductViewModel extends GetxController {
  final RegisterProductService registerProductService =
      RegisterProductService(iRegisterProduct: RegisterProductRepository());

  TextEditingController idProductController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  Future<bool> registerEmpleado() async {
    Product product = Product(
      idProduct: int.parse(idProductController.text),
      nombre: nameController.text,
      descripcion: descriptionController.text,
      precio: int.parse(priceController.text),
      categoria: int.parse(categoryController.text),
    );

    bool result = await registerProductService.registerProduct(product);

    return result;
  }

  static RegisterProductViewModel get findOrInitialize {
    try {
      return Get.find<RegisterProductViewModel>();
    } catch (e) {
      Get.put(RegisterProductViewModel());
      return Get.find<RegisterProductViewModel>();
    }
  }
}
