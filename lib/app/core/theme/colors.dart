import 'package:flutter/material.dart';

class AppColors {
  static const transparent = Colors.transparent;
  static const white = Colors.white;
  static const lightGray = Color(0xFFD3D3D3);
  static const darkGrey = Color(0xFFA9A9A9);
  static const gray = Colors.grey;
  static const black54 = Colors.black54;
  static const black87 = Colors.black87;
  static const black = Colors.black;
  static const green = Color(0xff4caf50);
  static const yellow = Color(0xffFFCF11);
  static const red = Colors.red;

  static final materialYellow = MaterialColor(AppColors.yellow.value, AppColors.materialColor(AppColors.yellow));

  static MaterialStateProperty<Color?>? material(Color color) {
    return MaterialStateProperty.all<Color>(color);
  }

  static Map<int, Color> materialColor(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;
    final lowDivisor = 6;
    final highDivisor = 5;
    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;

    return {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };
  }
}
