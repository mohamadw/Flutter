import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop_app/shared/styles/colors/colors.dart';

ThemeData lightMode() => ThemeData(
      appBarTheme: AppBarTheme(
        color:HexColor('#6C63FF'),
        backwardsCompatibility: false,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),

        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:primary_color,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      primaryColor: primary_color,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primary_color,
        type: BottomNavigationBarType.fixed,
      ),
      scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primary_color,
  ),
    );

ThemeData damoMode() => ThemeData(
      appBarTheme: AppBarTheme(
        color: HexColor("#121212"),
        backwardsCompatibility: false,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor("#121212"),
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor("#121212"),
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: HexColor("#03DAC6"),
        type: BottomNavigationBarType.fixed,
      ),
      scaffoldBackgroundColor: HexColor("#121212"),
    );
