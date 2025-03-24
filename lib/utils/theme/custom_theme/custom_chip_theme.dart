import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';

class CustomChipTheme {
  // private constructor
  CustomChipTheme._();

  //--------------------------- light theme ------------------------------------

  static ChipThemeData lightChipTheme = const ChipThemeData(
    disabledColor: ColorStrings.lightbackgroundSecondary,
    labelStyle: TextStyle(color: Colors.black),
    selectedColor: ColorStrings.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: Colors.black,
  );

  //---------------------------- dark theme ------------------------------------

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: ColorStrings.darkbackgroundSecondary,
    labelStyle: TextStyle(color: Colors.white),
    selectedColor: ColorStrings.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: Colors.white,
  );
}
