import 'package:bloc/bloc.dart';
import 'package:demo1/layouts/home_layout/todo_app/todo_layout.dart';
import 'package:demo1/shared/bloc_observer.dart';
import 'package:flutter/material.dart';
void main() {
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}


//Stateless
//Stateful


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomeLayout(),
    );
  }


}