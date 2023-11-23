import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/util/util.dart';
import '../../../../domain/empleado_module/edit_empleado/service/edit_empleado_service.dart';
import '../../../../domain/empleado_module/register_empleado/model/empleado_model.dart';
import '../../../../infraestructure/empleado_module/edit_empleado/edit_empleado_repository.dart';

class EditEmpleadoViewModel extends GetxController {
  final EditEmpleadoService editEmpleadoService =
      EditEmpleadoService(EditEmpleadoRepository());
  //
  TextEditingController idController = TextEditingController();
  TextEditingController nameOneController = TextEditingController();
  TextEditingController nameTwoController = TextEditingController();
  TextEditingController lastNameOneController = TextEditingController();
  TextEditingController lastNameTwoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  //
  TextEditingController searchController = TextEditingController();
  //
  RxList<Empleado> requestList = <Empleado>[].obs;

  Future<void> getEmpleados() async {
    requestList.value = await editEmpleadoService.getEmpleados(
        searchController.text.isEmpty ? '' : searchController.text);
  }

  Future<bool> deleteEmpleado({required String id}) async {
    bool response = await editEmpleadoService.deleteEmpleado(id: id);

    if (response) {
      requestList.removeWhere((element) => element.idEmpleado == id);
      return true;
    } else {
      return false;
    }
  }

  setClient(Empleado empleado) {
    idController.text = empleado.idEmpleado!.toString();
    nameOneController.text = empleado.nombreUno!;
    nameTwoController.text = empleado.nombreDos!;
    lastNameOneController.text = empleado.apellidoUno!;
    lastNameTwoController.text = empleado.apellidoDos!;
    //addressController.text = client.direccion!;
  }

  Future<bool> updateClient() async {
    Empleado empleado = Empleado();
    empleado.idEmpleado = Util.data.getInt(idController.text);
    empleado.nombreUno = nameOneController.text;
    empleado.nombreDos = nameTwoController.text;
    empleado.apellidoUno = lastNameOneController.text;
    empleado.apellidoDos = lastNameTwoController.text;

    return await editEmpleadoService.updateEmpleado(empleado: empleado);
  }

  ///
  ///
  static EditEmpleadoViewModel get findOrInitialize {
    try {
      return Get.find<EditEmpleadoViewModel>();
    } catch (e) {
      Get.put(EditEmpleadoViewModel());
      return Get.find<EditEmpleadoViewModel>();
    }
  }
}
