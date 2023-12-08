import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skillboxfirebaseapp/services/database.dart';

// Widget newTask(
//   String title, 
//   String color, 
//   Function setState,
//   bool isDone,
//   int indx
// ) {
//   return Card(
//       child: CheckboxListTile(
//         title: Text(
//           title,
//           style: const TextStyle(
//             decoration: TextDecoration.none
//           ),
//         ),
//         subtitle: Text(color),
//         value: isDone,
//           onChanged: (bool? newValue) {
//             print('IsDone is changing: ${isDone} !!!!!!!!!!!!!!!!!');
//             setState(() {
//               // isDone = newValue!;
//               isDone = !isDone;
//             });
//           },
//           controlAffinity: ListTileControlAffinity.trailing,
//       ),
//     )/*,
//   )*/;
// }