import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/papeleria/presentation/home/view/home_pg.dart';
import 'package:software2/papeleria/presentation/login/view_model/login_vm.dart';
import 'package:software2/shared/assets/assets.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:software2/shared/widgets/custom_alert.dart';
import 'package:software2/shared/widgets/custom_button.dart';
import 'package:software2/shared/widgets/custom_text_field.dart';
import 'package:software2/shared/widgets/separator.dart';

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
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('¡Bienvenido a Mi Papeleria!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ConstColors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  )),
              const Separator(size: 5),
              CustomTextField(
                icon: Icon(
                  Icons.person,
                  color: ConstColors.white,
                ),
                textColor: ConstColors.white,
                borderColor: ConstColors.white,
                textEditingController: loginViewModel.userController,
                labelText: 'Usuario',
              ),
              const Separator(size: 2),
              CustomTextField(
                icon: Icon(Icons.lock, color: ConstColors.white),
                textColor: ConstColors.white,
                borderColor: ConstColors.white,
                textEditingController: loginViewModel.passwordController,
                labelText: 'Contraseña',
              ),
              const Separator(size: 5),
              CustomButton(
                  onPressed: () async {
                    if (await loginViewModel.login()) {
                      Get.offAll(() => HomePage());
                    } else {
                      CustomAlert(
                          title: 'Error',
                          body: ' Usuario o contraseña incorrectos');
                    }
                  },
                  text: 'Iniciar Sesion',
                  colorContent: ConstColors.greyText,
                  width: Get.width * 0.8,
                  backgroundColor: ConstColors.white)
            ],
          ),
        ),
      ]),
    );
  }
}
