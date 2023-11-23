import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/papeleria/domain/proveedor_module/edit_proveedor/service/edit_empleado_service.dart';
import 'package:software2/papeleria/domain/proveedor_module/register_proveedor/model/proveedor_model.dart';
import 'package:software2/papeleria/infraestructure/proveedor_module/edit_proveedor/edit_proveedor_repository.dart';
import '../../../../../shared/util/util.dart';

class EditProveedorViewModel extends GetxController {
  final EditProveedorService editEmpleadoService =
      EditProveedorService(EditProveedorRepository());
  //
  TextEditingController idController = TextEditingController();
  TextEditingController nameOneController = TextEditingController();
  TextEditingController nameTwoController = TextEditingController();
  TextEditingController lastNameOneController = TextEditingController();
  TextEditingController lastNameTwoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController businessController = TextEditingController();

  //
  TextEditingController searchController = TextEditingController();
  //
  RxList<Proveedor> requestList = <Proveedor>[].obs;

  Future<void> getProveedor() async {
    requestList.value = await editEmpleadoService.getProveedor(
        searchController.text.isEmpty ? '' : searchController.text);
  }

  Future<bool> deleteProveedor({required String id}) async {
    bool response = await editEmpleadoService.deleteProveedor(id: id);

    if (response) {
      requestList.removeWhere((element) => element.idProveedor == id);
      return true;
    } else {
      return false;
    }
  }

  setProveedor(Proveedor proveedor) {
    idController.text = proveedor.idProveedor!.toString();
    nameOneController.text = proveedor.nombreUno!;
    nameTwoController.text = proveedor.nombreDos!;
    lastNameOneController.text = proveedor.apellidoUno!;
    lastNameTwoController.text = proveedor.apellidoDos!;
    businessController.text = proveedor.idEmpresa!.toString();
    //addressController.text = client.direccion!;
  }

  Future<bool> updateProveedor() async {
    Proveedor proveedor = Proveedor();
    proveedor.idProveedor = Util.data.getInt(idController.text);
    proveedor.nombreUno = nameOneController.text;
    proveedor.nombreDos = nameTwoController.text;
    proveedor.apellidoUno = lastNameOneController.text;
    proveedor.apellidoDos = lastNameTwoController.text;
    proveedor.idEmpresa = Util.data.getInt(businessController.text);

    return await editEmpleadoService.updateProveedor(proveedor: proveedor);
  }

  ///
  ///
  static EditProveedorViewModel get findOrInitialize {
    try {
      return Get.find<EditProveedorViewModel>();
    } catch (e) {
      Get.put(EditProveedorViewModel());
      return Get.find<EditProveedorViewModel>();
    }
  }
}
