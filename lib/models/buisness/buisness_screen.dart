import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news-app/cubit/cubit_layout.dart';
import 'package:news_app/layout/news-app/states/cubit_states_layout.dart';
import 'package:news_app/shared/components/components.dart';

class BuisnessScreen extends StatefulWidget {
  const BuisnessScreen({Key? key}) : super(key: key);

  @override
  _BuisnessScreen createState() => _BuisnessScreen();
}

class _BuisnessScreen extends State<BuisnessScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNewsLayout, NewsLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var articles = CubitNewsLayout.get(context).business;
        print(articles[0]);
        return buildArticlePage(articles);
      },
    );
  }
}
