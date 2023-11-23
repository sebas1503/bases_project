import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/papeleria/domain/client_module/edit_client/service/edit_client_service.dart';
import 'package:software2/papeleria/domain/client_module/register_client/model/client_model.dart';
import 'package:software2/papeleria/infraestructure/client_module/edit_client/edit_client_repository.dart';
import 'package:software2/shared/util/util.dart';

class EditClientViewModel extends GetxController {
  final EditClientService editClientService =
      EditClientService(EditClientRepository());
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
  RxList<Client> requestList = <Client>[].obs;

  Future<void> getClient() async {
    requestList.value = await editClientService
        .getClient(searchController.text.isEmpty ? '' : searchController.text);
  }

  Future<bool> deletedClient({required String id}) async {
    bool response = await editClientService.deleteClient(id: id);

    if (response) {
      requestList.removeWhere((element) => element.idClient == id);
      return true;
    } else {
      return false;
    }
  }

  setClient(Client client) {
    idController.text = client.idClient!.toString();
    nameOneController.text = client.nombreUno!;
    nameTwoController.text = client.nombreDos!;
    lastNameOneController.text = client.apellidoUno!;
    lastNameTwoController.text = client.apellidoDos!;
    //addressController.text = client.direccion!;
  }

  Future<bool> updateClient() async {
    Client client = Client();
    client.idClient = Util.data.getInt(idController.text);
    client.nombreUno = nameOneController.text;
    client.nombreDos = nameTwoController.text;
    client.apellidoUno = lastNameOneController.text;
    client.apellidoDos = lastNameTwoController.text;

    return await editClientService.updateClient(client: client);
  }

  ///
  ///
  static EditClientViewModel get findOrInitialize {
    try {
      return Get.find<EditClientViewModel>();
    } catch (e) {
      Get.put(EditClientViewModel());
      return Get.find<EditClientViewModel>();
    }
  }
}
