import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:software2/shared/widgets/custom_button.dart';
import 'package:software2/shared/widgets/custom_card.dart';
import 'package:software2/shared/widgets/separator.dart';

class CustomTwobuttonsImageAlert {
  final String title;
  final String? image;
  final String? subtitle;
  final String textbuttonOne;
  final String textbuttonTwo;
  final Function() onPressedOne;
  final Function() onPressedTwo;
  final bool? cancellable;
  CustomTwobuttonsImageAlert(
      {required this.title,
      required this.textbuttonOne,
      required this.textbuttonTwo,
      required this.onPressedOne,
      required this.onPressedTwo,
      this.image,
      this.subtitle,
      this.cancellable}) {
    showAlertDialog();
  }
  showAlertDialog() {
    Get.dialog(
      BounceInDown(
          duration: const Duration(milliseconds: 500),
          child: WillPopScope(
            onWillPop: () async {
              return cancellable ?? false;
            },
            child: Center(
              child: SizedBox(
                height: Get.height * 0.5,
                width: Get.width * 0.8,
                child: CustomCard(
                  padding: EdgeInsets.all(Get.height * 0.01),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Separator(size: 4),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ConstColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const Separator(size: 2),
                      if (image != null) Expanded(child: Image.asset(image!)),
                      if (image != null) const Separator(size: 2),
                      if (subtitle != null) Text(subtitle!),
                      if (subtitle != null) const Separator(size: 2),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButton(
                                height: Get.height * 0.05,
                                width: Get.width * 0.3,
                                onPressed: () => onPressedOne(),
                                text: textbuttonOne,
                                backgroundColor: ConstColors.primaryColor),
                            CustomButton(
                                height: Get.height * 0.05,
                                width: Get.width * 0.3,
                                onPressed: () => onPressedTwo(),
                                text: textbuttonTwo,
                                backgroundColor: ConstColors.primaryColor),
                          ])
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
