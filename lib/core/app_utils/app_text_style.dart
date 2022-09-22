import 'package:flutter/material.dart';

import 'app_fonts.dart';

class AppTextStyle {
  static TextStyle getTextStyle(
      double fontSize, FontWeight fontWeight, Color color) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: AppFonts.fontFamily,
        color: color,
        fontWeight: fontWeight);
  }

// regular style

  static TextStyle getRegularStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return getTextStyle(fontSize, FontWeightManager.regular, color);
  }

// medium style

  static TextStyle getMediumStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return getTextStyle(fontSize, FontWeightManager.medium, color);
  }

// medium style

  static TextStyle getLightStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return getTextStyle(fontSize, FontWeightManager.light, color);
  }

// bold style

  static TextStyle getBoldStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return getTextStyle(fontSize, FontWeightManager.bold, color);
  }

// semibold style

  static TextStyle getSemiBoldStyle(
      {double fontSize = FontSize.s12, required Color color}) {
    return getTextStyle(fontSize, FontWeightManager.semiBold, color);
  }
}
