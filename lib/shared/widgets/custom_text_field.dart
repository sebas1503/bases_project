import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/shared/colors/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.textEditingController,
      this.onChanged,
      this.hintText,
      this.labelText,
      this.keyboardType,
      this.maxLines,
      this.height,
      this.prefixIcon,
      this.borderColor,
      this.textColor,
      this.icon,
      this.onTap})
      : super(key: key);

  final TextEditingController textEditingController;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final double? height;
  final Icon? prefixIcon;
  final Color? borderColor;
  final Color? textColor;
  final Icon? icon;

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(
          color: widget.borderColor ?? ConstColors.greyText,
        ));

    return Column(
      children: [
        SizedBox(
          height: widget.height ?? Get.height * 0.06,
          child: TextField(
            maxLines: widget.maxLines ?? 1,
            keyboardType: widget.keyboardType,
            controller: widget.textEditingController,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            style: TextStyle(
                color: widget.textColor ?? ConstColors.greyText, fontSize: 18),
            decoration: InputDecoration(
                suffixIcon: widget.icon,
                prefixIcon: widget.prefixIcon,
                fillColor: ConstColors.white,
                hintText: widget.hintText,
                hintStyle:
                    TextStyle(color: widget.textColor ?? ConstColors.greyText),
                labelText: widget.labelText,
                labelStyle:
                    TextStyle(color: widget.textColor ?? ConstColors.greyText),
                focusedBorder: border,
                enabledBorder: border,
                border: border),
          ),
        ),
      ],
    );
  }
}
