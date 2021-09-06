import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news-app/cubit/cubit_layout.dart';
import 'package:news_app/layout/news-app/states/cubit_states_layout.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNewsLayout, NewsLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  DefaultTextForm(
                    controller: searchController,
                    labelText: 'Search',
                    prefixIcon: Icons.search,
                    validate: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    functionOnchange: (value) {
                       CubitNewsLayout.get(context).GetSearch(value);
                    },
                  ),
                  Expanded(child: buildArticlePage( CubitNewsLayout.get(context).search)),

                ],
              ),
            ),
          );
        });
  }
}
