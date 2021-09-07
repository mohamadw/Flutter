import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/app_cubit/app_states.dart';


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
      //CacheHelper.putBoolean(key: 'isDark', value: isDark);
    }
    emit(ChangeThemeModeState());
  }
}