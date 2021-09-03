import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
      home: HomeLayout(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(color:Colors.red)
      ),
    );
  }
}
