import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  //
  //
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool login() {
    if (userController.text == 'admin' && passwordController.text == 'admin') {
      return true;
    }
    return false;
  }

  static LoginViewModel get findOrInitialize {
    try {
      return Get.find<LoginViewModel>();
    } catch (e) {
      Get.put(LoginViewModel());
      return Get.find<LoginViewModel>();
    }
  }
}
