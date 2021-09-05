import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news-app/states/cubit_states_layout.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';


//http://newsapi.org/
// v2/top-headlines?country=il&category=business&apiKey=f1a3e932f5d349e79bda9cc8f38afb0f


class CubitNewsLayout extends Cubit<NewsLayoutStates> {
  CubitNewsLayout() : super(NewsInitialState());

  static CubitNewsLayout get(context) => BlocProvider.of(context);


  ///// Navigator Bar
  int navigator_bar_index = 0;
  List<dynamic> business = [],sports = [],science = [];
  bool isDark = false;
  IconData modeIcon = Icons.brightness_3_sharp;
  ChangeNavigatorBar(int index) {
    navigator_bar_index = index;
    emit(NewsNavigatorBarState());
    switch (index){
      case 0 : GetSportsArticles(); break;
      case 1: GetBusinessArticles(); break;
      case 2: GetScienceArticles(); break;

    }
  }

  void GetBusinessArticles(){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'il',
          'category':'business',
          'apiKey':'f1a3e932f5d349e79bda9cc8f38afb0f'
        }).then((value) {
      business = value.data['articles'];
      emit(GetBusinessNewsState());
    }).catchError((onError){
      print(onError.toString());
    });
  }
  void GetSportsArticles(){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'il',
          'category':'sport',
          'apiKey':'f1a3e932f5d349e79bda9cc8f38afb0f'
        }).then((value) {
      sports = value.data['articles'];
      emit(GetSportsNewsState());
    }).catchError((onError){
      print(onError.toString());
    });
  }
  void GetScienceArticles(){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'il',
          'category':'science',
          'apiKey':'f1a3e932f5d349e79bda9cc8f38afb0f'
        }).then((value) {
      science = value.data['articles'];
      emit(GetScienceNewsState());
    }).catchError((onError){
      print(onError.toString());
    });
  }

  void changeThemeMode(){
    if(isDark){
      isDark=false;
      modeIcon = Icons.brightness_3_sharp;
    }
    else{
      isDark=true;
      modeIcon = Icons.brightness_6_sharp;
    }
    emit(ChangeThemeModeState());
  }

}
