import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:software2/shared/widgets/custom_button.dart';
import 'package:software2/shared/widgets/custom_card.dart';
import 'package:software2/shared/widgets/separator.dart';

class CustomTwobuttonsAlert {
  final String title;
  final String? body;
  final String textbuttonOne;
  final String textbuttonTwo;
  final Function() onPressedOne;
  final Function() onPressedTwo;
  final bool? cancellable;
  CustomTwobuttonsAlert(
      {required this.title,
      required this.textbuttonOne,
      required this.textbuttonTwo,
      required this.onPressedOne,
      required this.onPressedTwo,
      this.body,
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
                height: Get.height * 0.25,
                width: Get.width * 0.85,
                child: CustomCard(
                  padding: EdgeInsets.all(Get.height * 0.01),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        // style: TextStyles.dynamicAileron(
                        //     percentageFontsize: 2.5,
                        //     color: Colores.primaryColor,
                        //     isBold: true),
                      ),
                      const Separator(size: 2),
                      if (body != null)
                        Text(
                          body!,
                          // style: TextStyles.dynamicAileron(
                          //     percentageFontsize: 1.5,
                          //     isBold: true,
                          //     color: Colores.mediumGray),
                          textAlign: TextAlign.center,
                        ),
                      if (body != null) const Separator(size: 2),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButton(
                                height: Get.height * 0.05,
                                width: Get.width * 0.37,
                                onPressed: () => onPressedOne(),
                                text: textbuttonOne,
                                backgroundColor: ConstColors.primaryColor),
                            CustomButton(
                                height: Get.height * 0.05,
                                width: Get.width * 0.37,
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
