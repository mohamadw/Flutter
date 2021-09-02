import 'package:demo1/modules/archived_tasks/archived_screen.dart';
import 'package:demo1/modules/done_tasks/done_tasks_screen.dart';
import 'package:demo1/modules/new_tasks/new_tasks_screen.dart';
import 'package:demo1/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit() : super(TodoInitialState());

  static TodoCubit get(context) => BlocProvider.of(context);

  int current_index = 0;
  Database database;
  List<Map> new_tasks = [], done_tasks = [], archived_tasks = [];
  IconData fb_icon = Icons.edit;
  bool isBottomSheetShown = false;

  List<Widget> navigate_bar_items_screen = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedScreen()
  ];

  changeNavigateBarIndex(int index) {
    current_index = index;
    emit(ChangeNavigateBarIndexState());
  }

  changeBottomSheet({@required bool isShown}) {
    if (isShown) {
      fb_icon = Icons.add;
    } else {
      fb_icon = Icons.edit;
    }
    isBottomSheetShown = isShown;
    emit(ChangeBottomSheetState());
  }

  Future<void> createDB() async {
    database = await openDatabase('todo_app.db', version: 1,
        onCreate: (database, version) {
      database
          .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
          .then((value) {
        print('table created');
        emit(CreateDBState());
      }).catchError((onError) {
        print('error when creating table ' + onError.toString());
      });
    }, onOpen: (database) {
      getDB(database);
    });
    return null;
  }

  void insertDB(String title, String time, String date) async {
     await database.transaction((txn) {
      txn
          .rawInsert(
              'insert into tasks(title,date,time,status) values ("$title","$date","$time","new")')
          .then((value) {
        print('$value inserted successfully ');
        emit(InsertDBState());
        getDB(database);
      }).catchError((onError) {
        print('error occured in insert ${onError.toString()}');
      });
      return null;
    });
  }

  void updateDB(int id, String status) async {
    database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', '$id']).then((value) {
      emit(TodoLoadingState());
      getDB(database);
      emit(UpdateDBState());
    });
  }

  void getDB(database) {
    new_tasks = [];
    done_tasks = [];
    archived_tasks = [];
    database.rawQuery('SELECT * from tasks').then((value) {
      print(value);
      value.forEach((element) {
        if (element['status'] == 'new')
          new_tasks.add(element);
        else if (element['status'] == 'done')
          done_tasks.add(element);
        else
          archived_tasks.add(element);
      });
      emit(GetDBState());
    });
  }

  void deleteDataDB({
    @required int id,
  }) async {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDB(database);
      emit(DeleteDBState());
    });
  }
}
