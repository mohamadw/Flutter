import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightMode() => ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.deepOrangeAccent,
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
          statusBarColor: Colors.deepOrangeAccent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepOrangeAccent,
        type: BottomNavigationBarType.fixed,
      ),
      scaffoldBackgroundColor: Colors.white,
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
