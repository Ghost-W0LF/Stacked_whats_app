import 'package:flutter/material.dart';
import 'package:stacked_app/base/theme/text_theme.dart';
import 'package:stacked_app/ui/common/app_colors.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    primaryColor:darkGrey,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    dividerColor: darkerGrey,
    appBarTheme:const AppBarTheme(backgroundColor: whatsAppGreen),

  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color.fromARGB(255, 32, 32, 32),
    primaryColor: lightGrey,
    brightness: Brightness.dark,
    dividerColor: lightGrey,
    appBarTheme:
        AppBarTheme(backgroundColor:whatsAppGreen.withOpacity(0.8)),
    textTheme: TTextTheme.darkTextTheme,
  );
}
