import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news-app/cubit/cubit_layout.dart';
import 'package:news_app/layout/news-app/states/cubit_states_layout.dart';
import 'package:news_app/shared/components/components.dart';

class Sport_Screen extends StatefulWidget {
  const Sport_Screen({Key? key}) : super(key: key);

  @override
  _Sport_ScreenState createState() => _Sport_ScreenState();
}

class _Sport_ScreenState extends State<Sport_Screen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNewsLayout, NewsLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var articles = CubitNewsLayout.get(context).sports;
        return buildArticlePage(articles);
      },
    );  }
}
