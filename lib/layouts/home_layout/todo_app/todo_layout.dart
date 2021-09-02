import 'package:demo1/modules/archived_tasks/archived_screen.dart';
import 'package:demo1/modules/done_tasks/done_tasks_screen.dart';
import 'package:demo1/modules/new_tasks/new_tasks_screen.dart';
import 'package:demo1/shared/components/components.dart';
import 'package:demo1/shared/components/constants.dart';
import 'package:demo1/shared/cubit/cubit.dart';
import 'package:demo1/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {
  var scaffold_key = GlobalKey<ScaffoldState>();

  TextEditingController title_controler = TextEditingController(),
      time_controler = TextEditingController(),
      date_controler = TextEditingController();
  var form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return TodoCubit()..createDB();
      },
      child: BlocConsumer<TodoCubit, TodoStates>(
        listener: (BuildContext context, TodoStates state) {},
        builder: (BuildContext context, TodoStates state) {
          TodoCubit cubit = TodoCubit.get(context);
          return Scaffold(
            key: scaffold_key,
            appBar: AppBar(
              title: Text(
                'Todo App',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: state is! TodoLoadingState?
            cubit.navigate_bar_items_screen[cubit.current_index]:
            Center(child: CircularProgressIndicator()),

            floatingActionButton: FloatingActionButton(
              child: Icon(cubit.fb_icon),
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (form_key.currentState.validate()) {
                    cubit
                        .insertDB(title_controler.text, time_controler.text,
                            date_controler.text);
                        Navigator.pop(context);


                  }
                } else {
                  scaffold_key.currentState
                      .showBottomSheet((context) => Container(
                            padding: EdgeInsets.all(20),
                            child: Form(
                              key: form_key,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  DefaultTextForm(
                                    controller: title_controler,
                                    labelText: 'Task Title',
                                    prefixIcon: Icons.title,
                                    validate: (String value) {
                                      if (value == null || value.isEmpty) {
                                        return 'title must not be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 15),
                                  DefaultTextForm(
                                    controller: time_controler,
                                    labelText: 'Task Time',
                                    prefixIcon: Icons.watch_later_outlined,
                                    validate: (String value) {
                                      if (value == null || value.isEmpty) {
                                        return 'time must not be empty';
                                      }
                                      return null;
                                    },
                                    functionOnTap: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((value) => time_controler.text =
                                          value.format(context).toString());
                                    },
                                  ),
                                  SizedBox(height: 15),
                                  DefaultTextForm(
                                    controller: date_controler,
                                    labelText: 'Task Date',
                                    prefixIcon: Icons.date_range,
                                    validate: (String value) {
                                      if (value == null || value.isEmpty) {
                                        return 'date must not be empty';
                                      }
                                      return null;
                                    },
                                    functionOnTap: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate:
                                                  DateTime.parse('2030-01-01'))
                                          .then((value) => date_controler.text =
                                              DateFormat.yMMMd().format(value));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .closed
                      .then((value) {
                    cubit.changeBottomSheet(isShown: false);
                  });
                  cubit.changeBottomSheet(isShown: true);
                }
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.current_index,
              onTap: (index) {
                cubit.changeNavigateBarIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive), label: 'Archived')
              ],
            ),
          );
        },
      ),
    );
  }
}
