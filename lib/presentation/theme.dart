import '../application/application.dart';
import 'presentation.dart';

ThemeData themeData(bool isLight) => ThemeData(
      primarySwatch: AppColors.primaryMaterialColor,
      scaffoldBackgroundColor:
          isLight ? AppColors.scaffoldBgColor : AppColors.scaffoldBgColorDark,
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: isLight ? AppColors.bodyText1Color : AppColors.bodyText1Color,
        ),
        bodyMedium: TextStyle(
          color: isLight ? AppColors.bodyText2Color : AppColors.bodyText2Color,
        ),
      ),
    );
