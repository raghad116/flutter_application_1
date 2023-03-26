import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData light = ThemeData(
  primarySwatch: Colors.amber,
  scaffoldBackgroundColor: Colors.white,
  // textTheme: TextTheme(bodyText1:  TextStyle(
  //   fontSize: 14,
  //   color: Colors.black,
  //   fontWeight: FontWeight.w600
  // ) ),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 30),
      iconTheme: IconThemeData(color: Colors.black),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark)),
);

ThemeData dark = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[700],
      unselectedItemColor: Colors.white,
      elevation: 50),
  scaffoldBackgroundColor: Colors.grey[700],
  primarySwatch: Colors.amber,
  // textTheme: TextTheme(bodyText1: TextStyle(
  //   fontSize: 14,
  //   color: Colors.white,
  //   fontWeight: FontWeight.w600
  // )),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[700],
      elevation: 0.0,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
      iconTheme: IconThemeData(color: Colors.white),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey[700],
          statusBarIconBrightness: Brightness.light)),
);
