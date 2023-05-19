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
  static MaterialColor primaryMaterialColor = materialColor(yellow1);
  static const Color secondaryColor = blue1;

  static const Color fabBgColor = yellow1;

  static const Color appBarGradientStop1 = yellow1;
  static const Color appBarGradientStop2 = pink1;
  static const Color appBarGradientStop3 = purple1;

  static const Color scaffoldBgColor = Colors.white;

  static const Color bodyText1Color = black1;
  static const Color bodyText2Color = black1;
  static const Color descriptionTextColor = gray1;
  static Color linkColor = secondaryColor;

  // Dark theme colors
  static const Color scaffoldBgColorDark = blue2;

  static const Color bodyText1ColorDark = Colors.white;
  static const Color bodyText2ColorDark = Colors.white;

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static MaterialColor materialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
