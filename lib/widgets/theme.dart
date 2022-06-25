// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.red,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        buttonColor: darkBluishColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: darkBluishColor,
          primary: Color.fromARGB(255, 41, 0, 155),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6,
        ),
        // primaryTextTheme: GoogleFonts.latoTextTheme(),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: drakcreamColor,
        buttonColor: lightBluishColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.white,
            primary: Color.fromARGB(255, 3, 161, 85),
            brightness: Brightness.dark),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white),
          titleTextStyle: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
        
        ),
      );

  static Color creamColor = Color(0xfff5f5f5);
  static Color drakcreamColor = Vx.gray900;
  static Color darkBluishColor = Color.fromARGB(255, 22, 2, 110);
  static Color lightBluishColor = Vx.indigo500;
}
