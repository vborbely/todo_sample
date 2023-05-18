import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color black1 = Colors.black87;
  static const Color gray1 = Color(0xFF595A5B);
  static const Color blue2 = Color(0xFF22273c);
  static const Color blue1 = Color(0xFF3f4f75);
  static const Color purple1 = Color(0xFF9443ae);
  static const Color pink1 = Color(0xFFe773af);
  static const Color yellow1 = Color(0xFFfea252);

  static const Color primaryColor = yellow1;
  static const Color secondaryColor = blue1;

  static const Color appBarGradientStop1 = yellow1;
  static const Color appBarGradientStop2 = pink1;
  static const Color appBarGradientStop3 = purple1;

  static const Color scaffoldBgColor = gray1;
  static const Color bodyText1Color = black1;
  static const Color bodyText2Color = black1;
  static Color linkColor = secondaryColor;

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
