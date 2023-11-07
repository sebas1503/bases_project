import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/shared/colors/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(110);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ConstColors.primaryColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Container(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            child: Container(
              width: double.infinity,
              color: ConstColors.primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Text(
                  title,
                  style: TextStyle(
                      color: ConstColors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )),
      actions: [
        Container(
            margin: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () => {Get.back()},
              child: Row(
                children: [
                  Text('Cerrar',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: ConstColors.white)),
                  const SizedBox(width: 10),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                          width: 22,
                          height: 22,
                          color: ConstColors.white,
                          child: Icon(
                            Icons.close,
                            color: ConstColors.primaryColor,
                            size: 15,
                          )))
                ],
              ),
            ))
      ],
    );
  }
}
