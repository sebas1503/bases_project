import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/_iatech/presentation/login/view_model/login_vm.dart';
import 'package:software2/shared/assets/assets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginViewModel loginViewModel = LoginViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          Res.images.loginBackground,
          height: Get.height,
          width: Get.width,
          fit: BoxFit.cover,
        ),
        Column(
          children: [],
        ),
      ]),
    );
  }
}
