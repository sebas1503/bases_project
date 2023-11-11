import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/_iatech/domain/register/model/aspirante_model.dart';
import 'package:software2/_iatech/domain/request/service/request_service.dart';
import 'package:software2/_iatech/infraestructure/request/request_repository.dart';

class RequestViewModel extends GetxController {
  final RequestService requestService = RequestService(RequestRepository());
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
  //
  TextEditingController searchController = TextEditingController();
  //
  RxList<Candidate> requestList = <Candidate>[].obs;

  Future<void> getRequest() async {
    requestList.value = await requestService
        .getRequest(searchController.text.isEmpty ? '' : searchController.text);
  }

  Future<void> deletedRequest({required String id}) async {
    bool response = await requestService.deeltedRequest(id: id);

    if (response) {
      requestList.removeWhere((element) => element.cedula == id);
    }
  }

  setCandidate(Candidate candidate) {
    nameController.text = candidate.nombre!;
    lastNameController.text = candidate.apellido!;
    idController.text = candidate.cedula!;
    birthDateController.text = candidate.fechaNacimiento!;
    emailController.text = candidate.email!;
    phoneController.text = candidate.telefono!;
    addresController.text = candidate.direccion!;
    cityController.text = candidate.ciudad!;
    positionController.text = candidate.cargo!;
    salaryController.text = candidate.salario!.toString();
    levelController.text = candidate.nivelEstudios!;
  }

  Future<bool> updateCandidate() async {
    Candidate candidate = Candidate();
    candidate.nombre = nameController.text;
    candidate.apellido = lastNameController.text;
    candidate.cedula = idController.text;
    candidate.fechaNacimiento = birthDateController.text;
    candidate.email = emailController.text;
    candidate.telefono = phoneController.text;
    candidate.direccion = addresController.text;
    candidate.ciudad = cityController.text;
    candidate.cargo = positionController.text;
    candidate.salario = double.parse(salaryController.text);
    candidate.nivelEstudios = levelController.text;

    return await requestService.updateRequest(candidate: candidate);
  }

  ///
  ///
  static RequestViewModel get findOrInitialize {
    try {
      return Get.find<RequestViewModel>();
    } catch (e) {
      Get.put(RequestViewModel());
      return Get.find<RequestViewModel>();
    }
  }
}
