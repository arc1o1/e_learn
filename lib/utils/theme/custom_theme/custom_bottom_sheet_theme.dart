import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';

class CustomBottomSheetTheme {
  // private constructor
  CustomBottomSheetTheme._();

  //--------------------------- light theme ------------------------------------

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: ColorStrings.lightbackgroundPrimary,
    modalBackgroundColor: ColorStrings.lightbackgroundPrimary,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  //---------------------------- dark theme ------------------------------------

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: ColorStrings.darkbackgroundPrimary,
    modalBackgroundColor: ColorStrings.darkbackgroundPrimary,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
