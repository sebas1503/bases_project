import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  static LoginViewModel get findOrInitialize {
    try {
      return Get.find<LoginViewModel>();
    } catch (e) {
      Get.put(LoginViewModel());
      return Get.find<LoginViewModel>();
    }
  }
}
