import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterViewModel extends GetxController {
  //

  TextEditingController birthDateController = TextEditingController();

  static RegisterViewModel get findOrInitialize {
    try {
      return Get.find<RegisterViewModel>();
    } catch (e) {
      Get.put(RegisterViewModel());
      return Get.find<RegisterViewModel>();
    }
  }
}
