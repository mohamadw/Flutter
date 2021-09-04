


import 'package:flutter/material.dart';
import 'package:news_app/layout/news-app/cubit/cubit_layout.dart';


MyBottomNavigationBar(context) {
  var cubit  = CubitNewsLayout.get(context);

  return BottomNavigationBar(
    currentIndex: cubit.navigator_bar_index,
    onTap: (index){cubit.ChangeNavigatorBar(index);},
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.sports_basketball), label: 'sports'),
      BottomNavigationBarItem(icon: Icon(Icons.business), label: 'business'),
      BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
    ],
  );}