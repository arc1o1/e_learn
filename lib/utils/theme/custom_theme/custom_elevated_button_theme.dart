import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonTheme {
  // private constructor
  CustomElevatedButtonTheme._();

  //--------------------------- light theme ------------------------------------

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: ColorStrings.primary,
      disabledForegroundColor: ColorStrings.lightbackgroundSecondary,
      disabledBackgroundColor: ColorStrings.lightbackgroundSecondary,
      side: const BorderSide(color: ColorStrings.primary),
      padding: const EdgeInsets.all(5),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    ),
  );

  //---------------------------- dark theme ------------------------------------

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: ColorStrings.primary,
      disabledForegroundColor: ColorStrings.lightbackgroundSecondary,
      disabledBackgroundColor: ColorStrings.lightbackgroundSecondary,
      side: const BorderSide(color: ColorStrings.primary),
      padding: const EdgeInsets.all(5),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    ),
  );
}
