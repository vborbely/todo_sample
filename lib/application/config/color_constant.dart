import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColor = Colors.orangeAccent;
  static const Color secondaryColor = Colors.lightGreenAccent;

  static const Color black1 = Colors.black87;
  static const Color gray1 = Color(0xFF595A5B);

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
