import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/shared/colors/colors.dart';

class CustomNormalAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomNormalAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ConstColors.backgroundPage,
      centerTitle: false,
      leading: InkWell(
        onTap: () => Get.back(),
        child: Icon(
          Icons.arrow_back,
          color: ConstColors.black,
        ),
      ),
      title: AutoSizeText(
        title,
        maxLines: 2,
        style: TextStyle(color: ConstColors.primaryColor),
      ),
      elevation: 0,
    );
  }
}
