import 'package:flutter/material.dart';
import 'package:shop_app/modules/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:shop_app/shared/styles/themes.dart';

//git add -A && git commit -m
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode(),
      themeMode:ThemeMode.light ,
      home: onBoardingScreen() ,
    );
  }
}


