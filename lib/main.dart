import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/news-app/cubit/cubit_layout.dart';
import 'package:news_app/layout/news-app/home_layout/home_layout.dart';
import 'package:news_app/shared/app_cubit/app_cubit.dart';
import 'package:news_app/shared/app_cubit/states/app_states.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/network/local/chache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

//http://newsapi.org/
// v2/top-headlines?country=il&category=business&apiKey=f1a3e932f5d349e79bda9cc8f38afb0f
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(NewsApp(isDark));
}

class NewsApp extends StatelessWidget {
  final bool? isDark;

  NewsApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                AppCubit()..changeThemeMode(fromShared: isDark)),
        BlocProvider(
            create: (context) => CubitNewsLayout()
              ..GetSportsArticles()
              ..GetScienceArticles()
              ..GetBusinessArticles())
      ],
      child: BlocConsumer<AppCubit, AppStates>(
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
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}
