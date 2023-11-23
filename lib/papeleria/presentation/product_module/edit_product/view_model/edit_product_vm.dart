import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/papeleria/domain/product_module/edit_product/service/edit_product_service.dart';
import 'package:software2/papeleria/domain/product_module/register_product/model/product_model.dart';
import 'package:software2/papeleria/infraestructure/product_module/edit_producto/edit_product_repository.dart';
import '../../../../../shared/util/util.dart';

class EditProductViewModel extends GetxController {
  final EditProductService editProductService =
      EditProductService(EditProductRepository());
  //
  TextEditingController idProductController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  //
  TextEditingController searchController = TextEditingController();
  //
  RxList<Product> requestList = <Product>[].obs;

  Future<void> getProducts() async {
    requestList.value = await editProductService
        .getProduct(searchController.text.isEmpty ? '' : searchController.text);
  }

  Future<bool> deleteProduct({required String id}) async {
    bool response = await editProductService.deleteProduct(id: id);

    if (response) {
      requestList.removeWhere((element) => element.idProduct == id);
      return true;
    } else {
      return false;
    }
  }

  setProduct(Product product) {
    idProductController.text = product.idProduct!.toString();
    nameController.text = product.nombre!;
    descriptionController.text = product.descripcion!;
    priceController.text = product.precio!.toString();
    categoryController.text = product.categoria!.toString();
    //addressController.text = client.direccion!;
  }

  Future<bool> updateProduct() async {
    Product product = Product();
    product.idProduct = Util.data.getInt(idProductController.text);
    product.nombre = nameController.text;
    product.descripcion = descriptionController.text;
    product.precio = int.parse(priceController.text);
    product.categoria = Util.data.getInt(categoryController.text);

    return await editProductService.updatProduct(product: product);
  }

  ///
  ///
  static EditProductViewModel get findOrInitialize {
    try {
      return Get.find<EditProductViewModel>();
    } catch (e) {
      Get.put(EditProductViewModel());
      return Get.find<EditProductViewModel>();
    }
  }
}
