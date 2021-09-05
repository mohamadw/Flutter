import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news-app/cubit/cubit_layout.dart';
import 'package:news_app/layout/news-app/states/cubit_states_layout.dart';
import 'package:news_app/shared/components/components.dart';

class ScienceScreen extends StatefulWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  _ScienceScreen createState() => _ScienceScreen();
}

class _ScienceScreen extends State<ScienceScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNewsLayout, NewsLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var articles = CubitNewsLayout.get(context).science;
        print(articles[0]);
        return buildArticlePage(articles);
      },
    );  }
}
