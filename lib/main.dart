import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/news-app/cubit/cubit_layout.dart';
import 'package:news_app/layout/news-app/home_layout/home_layout.dart';
import 'package:news_app/layout/news-app/states/cubit_states_layout.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

//http://newsapi.org/
// v2/top-headlines?country=il&category=business&apiKey=f1a3e932f5d349e79bda9cc8f38afb0f
void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return CubitNewsLayout();
      },
      child: BlocConsumer<CubitNewsLayout, NewsLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
            darkTheme: ThemeData(
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
            ),
            themeMode: CubitNewsLayout.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
          );
        },
      ),
    );
  }
}
