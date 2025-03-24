import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:e_learn/utils/theme/custom_theme/custom_appbar_theme.dart';
import 'package:e_learn/utils/theme/custom_theme/custom_bottom_sheet_theme.dart';
import 'package:e_learn/utils/theme/custom_theme/custom_chip_theme.dart';
import 'package:e_learn/utils/theme/custom_theme/custom_elevated_button_theme.dart';
import 'package:e_learn/utils/theme/custom_theme/custom_text_field_theme.dart';
import 'package:e_learn/utils/theme/custom_theme/custom_text_theme.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  // private constructor1
  CustomTheme._();

  //--------------------------- light theme ------------------------------------

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'NunitoSans',
    brightness: Brightness.light,
    primaryColor: ColorStrings.primary,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorStrings.primary),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: CustomTextFieldTheme.lightInputDecorationTheme,
    textTheme: CustomTextTheme.lightTextTheme,
  );

  //--------------------------- dark theme -------------------------------------

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'NunitoSans',
    brightness: Brightness.dark,
    primaryColor: ColorStrings.primary,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorStrings.primary),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: CustomTextFieldTheme.darkInputDecorationTheme,
    textTheme: CustomTextTheme.darkTextTheme,
  );
}
