import 'package:get/get.dart';
import 'package:software2/_iatech/domain/register/model/aspirante_model.dart';
import 'package:software2/_iatech/domain/request/service/request_service.dart';
import 'package:software2/_iatech/infraestructure/request/request_repository.dart';

class RequestViewModel extends GetxController {
  //
  RxList<Candidate> requestList = <Candidate>[].obs;

  final RequestService requestService = RequestService(RequestRepository());

  Future<void> getRequest() async {
    requestList.value = await requestService.getRequest();
  }

  //
  ///
  ///
  ///
  ///
  ///
  ///
  ///
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
