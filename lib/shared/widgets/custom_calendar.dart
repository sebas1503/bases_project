// import 'package:flutter/material.dart';
// import 'package:mundial_digital/shared/colors/colors.dart';
// import 'package:mundial_digital/shared/widgets/custom_button.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class CustomCalendar extends StatelessWidget {
//   const CustomCalendar({
//     super.key,
//     required this.onPressedOne,
//     required this.onPressedTwo,
//     this.onSelect,
//     required this.onPressedThree,
//   });
//   final void Function() onPressedOne;
//   final void Function() onPressedTwo;
//   final void Function(DateRangePickerSelectionChangedArgs)? onSelect;
//   final void Function() onPressedThree;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: ConstColors.white,
//           ),
//           padding: const EdgeInsets.all(8),
//           child: Column(
//             children: [
//               SfDateRangePicker(
//                 rangeSelectionColor: Colors.red[100],
//                 todayHighlightColor: Colors.red,
//                 selectionColor: Colors.red,
//                 startRangeSelectionColor: Colors.red,
//                 endRangeSelectionColor: Colors.red,
//                 onSelectionChanged: onSelect,
//                 selectionMode: DateRangePickerSelectionMode.range,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   CustomButton(
//                       onPressed: onPressedOne,
//                       text: 'Aceptar',
//                       backgroundColor: ConstColors.primaryColor),
//                   CustomButton(
//                       onPressed: onPressedTwo,
//                       text: 'Cancelar',
//                       backgroundColor: ConstColors.primaryColor),
//                   CustomButton(
//                       leftIconData: const Icon(Icons.delete_forever_outlined),
//                       onPressed: onPressedThree,
//                       text: 'Limpiar',
//                       backgroundColor: ConstColors.black)
//                 ],
//               )
//             ],
//           )),
//     );
//   }
// }
