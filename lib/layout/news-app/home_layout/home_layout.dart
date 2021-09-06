import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news-app/cubit/cubit_layout.dart';
import 'package:news_app/layout/news-app/states/cubit_states_layout.dart';
import 'package:news_app/models/buisness/buisness_screen.dart';
import 'package:news_app/models/science/science_screen.dart';
import 'package:news_app/models/search_screen/search_screen.dart';
import 'package:news_app/models/sport/sport_screen.dart';
import 'package:news_app/shared/app_cubit/app_cubit.dart';
import 'package:news_app/shared/components/components.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return  BlocConsumer<CubitNewsLayout, NewsLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CubitNewsLayout.get(context);

          return Scaffold(
              appBar: AppBar(
                titleSpacing:20 ,
                title: Text('NewsApp'),
                actions: [
                  IconButton(onPressed: () {
                    AppCubit.get(context).changeThemeMode();
                  }, icon: Icon(AppCubit.get(context).modeIcon)),
                  IconButton(onPressed: () {
                    navigateTo(context, SearchScreen(),);
                  }, icon: Icon(Icons.search)),
                ],
              ),
              body:cubit.screens[cubit.navigator_bar_index],
              bottomNavigationBar: MyBottomNavigationBar(context));
        },
    );
  }
}
