import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/layout/news-app/home_layout/home_layout.dart';
import 'package:news_app/shared/bloc_observer.dart';

//http://newsapi.org/v2/top-headlines?country=il&category=business&apiKey=f1a3e932f5d349e79bda9cc8f38afb0f
void main() {
  Bloc.observer = MyBlocObserver();
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
      theme: ThemeData(
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
      ),
    );
  }
}
