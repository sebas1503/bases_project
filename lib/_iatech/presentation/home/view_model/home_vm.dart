import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  //
  //
  //
  //
  //
  ///
  static HomeViewModel get findOrInitialize {
    try {
      return Get.find<HomeViewModel>();
    } catch (e) {
      Get.put(HomeViewModel());
      return Get.find<HomeViewModel>();
    }
  }
}
