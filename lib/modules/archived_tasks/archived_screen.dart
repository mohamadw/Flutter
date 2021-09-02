
import 'package:demo1/shared/components/components.dart';
import 'package:demo1/shared/cubit/cubit.dart';
import 'package:demo1/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<TodoCubit,TodoStates>(
      listener:(context,state){} ,
      builder: (context,state){
        return BuilderTasks(TodoCubit.get(context).archived_tasks);

      } ,


    );  }
}
