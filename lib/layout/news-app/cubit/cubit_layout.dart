import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news-app/states/cubit_states_layout.dart';

class CubitNewsLayout extends Cubit<NewsLayoutStates> {
  CubitNewsLayout() : super(NewsInitialState());

  static CubitNewsLayout get(context) => BlocProvider.of(context);


  ///// Navigator Bar
  int current_index = 0;

  ChangeNavigatorBar(int index) {
    current_index = index;
    emit(NewsNavigatorBarState());
  }
}
