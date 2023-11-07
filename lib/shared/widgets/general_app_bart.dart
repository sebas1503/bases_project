import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:software2/shared/assets/assets.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GeneralAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: HexColor('#E5E5E5'),
      centerTitle: false,
      title: SvgPicture.asset(Res.icons.logoIcon),
      elevation: 0,
      actions: const [],
    );
  }
}
