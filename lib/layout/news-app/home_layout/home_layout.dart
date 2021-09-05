import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news-app/cubit/cubit_layout.dart';
import 'package:news_app/layout/news-app/states/cubit_states_layout.dart';
import 'package:news_app/models/buisness/buisness_screen.dart';
import 'package:news_app/models/science/science_screen.dart';
import 'package:news_app/models/sport/sport_screen.dart';
import 'package:news_app/shared/components/components.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) {
          return CubitNewsLayout();
        },

      child:BlocConsumer<CubitNewsLayout,NewsLayoutStates>(
        listener:(context , state) {} ,
        builder:(context , state){
          var cubit  = CubitNewsLayout.get(context);
          List<Widget> screens = [
            Sport_Screen(),
            BuisnessScreen(),
            ScienceScreen(),
          ];
          return Scaffold(
              appBar: AppBar(
                title: Text('NewsApp'),
                actions: [
                  Icon(Icons.search),
                ],
              ),
              body: screens[cubit.navigator_bar_index],
              bottomNavigationBar:MyBottomNavigationBar(context)
          );

        } ,
      )
    );
  }
}
