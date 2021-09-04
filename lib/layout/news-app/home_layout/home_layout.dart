import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news-app/cubit/cubit_layout.dart';
import 'package:news_app/layout/news-app/states/cubit_states_layout.dart';
import 'components_layout/components_layout.dart';

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

          return Scaffold(
              appBar: AppBar(
                title: Text('NewsApp'),
              ),
              body: Text('Home'),
              bottomNavigationBar:MyBottomNavigationBar(context)
          );

        } ,
      )
    );
  }
}
