import 'package:flutter/material.dart';
import 'package:news_app/shared/components/components.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewsApp'),
      ),
      body: Text('Home'),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          NavigatorBarItem(icon:Icons.sports_basketball , label:'sports' ),
          NavigatorBarItem(icon:Icons.business , label:'business' ),
          NavigatorBarItem(icon:Icons.science , label:'science' ),
        ],
      ),
    );
  }
}
