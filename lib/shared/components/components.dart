import 'package:demo1/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';

Widget DefaultTextForm({
  @required TextEditingController controller,
  @required String labelText,
  @required IconData prefixIcon,
  @required Function validate,
  IconData suffixIcon,
  bool obscureText = false,
  TextInputType keyboardType = TextInputType.text,
  bool enabled = true,
  Function functionOnTap,
  Function functionOnSubmit,
  Function functionOnchange,
}) =>
    TextFormField(
      controller: controller,
      onChanged: functionOnchange,
      onFieldSubmitted: functionOnSubmit,
      onTap: functionOnTap,
      validator: validate,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        border: OutlineInputBorder(),
        enabled: enabled,
      ),
    );

Widget Task_Item(Map map,BuildContext context) {
  return Dismissible(
    key:Key(map['id'].toString()),
      onDismissed:(direction)
      {TodoCubit.get(context).deleteDataDB(id: map['id']);},

    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 40,
            child: Text(
              "${map['time']}",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${map['title']}",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
                SizedBox(height: 5),
                Text("${map['date']}"),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.check_box,
              color: Colors.green,
            ),
            onPressed: () {
              TodoCubit.get(context).updateDB(map['id'], 'done');
            },
          ),
          IconButton(
            icon: Icon(Icons.archive_outlined, color: Colors.black26),
            onPressed: () {
              TodoCubit.get(context).updateDB(map['id'], 'archive');

            },
          )
        ],
      ),
    ),
  );
}

Widget BuilderTasks(List<Map> tasks){
  return ListView.separated(
      itemBuilder: (context,index) =>Task_Item(tasks[index],context),
      separatorBuilder: (context,index) => Container(
        height: 1,
        width: double.infinity,
        color: Colors.grey[300],
      ),
      itemCount: tasks.length);
}
