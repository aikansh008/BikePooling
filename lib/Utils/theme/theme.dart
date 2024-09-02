import 'package:bike_pooling/Utils/theme/Appbartheme.dart';
import 'package:bike_pooling/Utils/theme/elevatedbutton.dart';
import 'package:bike_pooling/Utils/theme/texttheme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();
  //creating object of themedata class for light theme//
  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor:Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme:ttexttheme.lighttheme,
    elevatedButtonTheme:elevatedbuttontheme.lightelevatedbuttontheme,
    appBarTheme:tappbartheme.lightappbar,
  );
   static ThemeData darktheme = ThemeData(
     useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor:Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme:ttexttheme.darktheme,
    elevatedButtonTheme:elevatedbuttontheme.darkelevatedbuttontheme,
    appBarTheme:tappbartheme.darkappbar,
   );
}
