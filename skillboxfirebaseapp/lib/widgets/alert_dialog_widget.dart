import 'package:flutter/material.dart';
import 'package:skillboxfirebaseapp/model/todo_task_model.dart';
import 'package:skillboxfirebaseapp/services/database.dart';

Widget alertDialog(BuildContext context) {
  String color = '';
  String date = '';
  String name = '';
  String id = '';

  return AlertDialog(
    title: const Text('New task'),
    actionsPadding: EdgeInsets.zero,
    content: Column(
      children: [
        const Text('Color: '),
        TextField(
          onChanged: (String clr) {
            color = clr;
          },
        ),

        const Text('Date: '),
        TextField(
          onChanged: (String datee) {
            date = datee;
          },
        ),

        const Text('Name: '),
        TextField(
          onChanged: (String namee) {
            name = namee;
          },
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () {
          Database.addTask(Tasks(color: color, date: date, name: name, id: id));
          Navigator.pop(context);
        }, 
        child: const Text('Add')
      ),
    ],
  );
}
