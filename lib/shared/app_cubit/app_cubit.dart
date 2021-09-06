import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/app_cubit/states/app_states.dart';
import 'package:news_app/shared/network/local/chache_helper.dart';

//http://newsapi.org/
// v2/top-headlines?country=il&category=business&apiKey=f1a3e932f5d349e79bda9cc8f38afb0f

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  ///// Navigator Bar
  bool isDark = false;
  IconData modeIcon = Icons.brightness_3_sharp;



  void changeThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      if (isDark) {
        isDark = false;
        modeIcon = Icons.brightness_3_sharp;
      } else {
        isDark = true;
        modeIcon = Icons.brightness_6_sharp;
      }
      CacheHelper.putBoolean(key: 'isDark', value: isDark);
    }
    emit(ChangeThemeModeState());
  }
}
