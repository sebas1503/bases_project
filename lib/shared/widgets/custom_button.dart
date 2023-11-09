import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.width = 100,
    required this.backgroundColor,
    this.colorContent = Colors.white,
    this.leftIcon,
    this.blockDoubleClick = true,
    this.borderRadio = 40,
    this.padding,
    this.rightIcon,
    this.height,
    this.iconSize,
    this.textStyle,
    this.leftIconData,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double width;
  final double? height;
  final bool? blockDoubleClick;
  final Color backgroundColor;
  final Color colorContent;
  final double borderRadio;
  final EdgeInsets? padding;
  final AssetImage? leftIcon;
  final Icon? leftIconData;
  final Widget? rightIcon;
  final double? iconSize;
  final TextStyle? textStyle;

  final RxBool absorbPointer = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx((() => AbsorbPointer(
          absorbing: absorbPointer.value,
          child: (ElevatedButton(
            onPressed: () {
              if (blockDoubleClick!) {
                absorbPointer.value = true;
                onBlockBoubleCLick();
              }
              onPressed.call();
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(width, height ?? Get.height * 0.06),
              padding: padding ?? EdgeInsets.zero,
              backgroundColor: backgroundColor,
              minimumSize: Size(0, height ?? Get.height * 0.06),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadio),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (leftIcon != null)
                  ImageIcon(
                    leftIcon,
                    color: colorContent,
                    size: iconSize,
                  ),
                if (leftIconData != null) leftIconData!,
                if (leftIcon != null || rightIcon != null) const Spacer(),
                AutoSizeText(
                  text,
                  style: textStyle ??
                      TextStyle(
                          color: colorContent, fontWeight: FontWeight.bold),
                ),
                if (leftIcon != null || rightIcon != null) const Spacer(),
                if (rightIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: rightIcon ?? Container(),
                  ),
              ],
            ),
          )),
        )));
  }

  onBlockBoubleCLick() {
    Future.delayed(const Duration(seconds: 2), () {
      absorbPointer.value = false;
    });
  }
}
