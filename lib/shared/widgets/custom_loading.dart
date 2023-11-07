import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software2/shared/colors/colors.dart';
import 'package:software2/shared/widgets/separator.dart';

import '../assets/assets.dart';

class CustomLoading {
  final String title;
  final bool? barrierDismissible;
  final TextStyle? textStyle;

  CustomLoading(
      {this.textStyle, required this.title, this.barrierDismissible}) {
    showLoadingDialog();
  }

  showLoadingDialog() {
    Get.dialog(
        WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: BodyLoading(title: title, textStyle: textStyle),
        ),
        barrierDismissible:
            barrierDismissible != null ? barrierDismissible! : false);
  }
}

class BodyLoading extends StatelessWidget {
  const BodyLoading({
    Key? key,
    required this.title,
    this.textStyle,
  }) : super(key: key);

  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Progress(),
            const Separator(size: 10),
            Text(
              title,
              // style: textStyle ??
              //     TextStyles.headlineStyle(
              //         isBold: true, color: Colores.whiteColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class Progress extends StatefulWidget {
  const Progress({
    Key? key,
  }) : super(key: key);

  @override
  State<Progress> createState() => _ProgressAnimadoState();
}

class _ProgressAnimadoState extends State<Progress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..repeat(reverse: true);

    rotation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    // controller.addListener(() {
    //   if (controller.isCompleted) {
    //     controller.repeat();
    //   }
    // }
    //);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //controller.forward();
    return ScaleTransition(
      scale: rotation,
      child: SizedBox(
        width: Get.width * 0.4,
        child: Image.asset(
          Res.images.loading,
          fit: BoxFit.fitWidth,
          color: ConstColors.primaryColor,
        ),
      ),
      // builder: (BuildContext context, Widget? child) {
      //   return Transform.rotate(
      //     angle: rotation.value,
      //     child: child,
      //   );
      // },
    );
  }
}
