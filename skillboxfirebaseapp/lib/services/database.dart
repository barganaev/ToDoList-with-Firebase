import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:skillboxfirebaseapp/model/todo_task_model.dart';

class Database {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> getTask() async {
    var list = await _db.collection('store_collection').get();
    // return list;
  }

  static Future<void> addTask(Tasks task) async {
    await _db.collection('store_collection').doc().set(task.toJson()).catchError((e) {
      print(e);
    });
  }

  // static Future<void> addTask(Map<String, dynamic> task) async {
  //   await _db.collection('store_collection').doc().set(task).catchError((e) {
  //     print(e);
  //   });
  //   // return true;
  // }

  static Future<void> updateTask(String id, Map<String, dynamic> task) async {
    await _db.collection('store_collection').doc(id).update(task).catchError((e) {
      print(e);
    });
    // return true;
  }

  static Future<void> deleteTask(String id) async {
    await _db.collection('store_collection').doc(id).delete().catchError((e) {
      print(e);
    });
  }

  // static Future<void> deleteTask(String id) async {
  //   await _db.collection('store_collection').doc(id).delete().catchError((e) {
  //     print(e);
  //   });
  //   // return true;
  // }

  static Future<String> getImage() async {
    // var ref = FirebaseStorage.instance.ref().child('images').child('exp53.PNG');
    var ref = FirebaseStorage.instance.ref().child('minion.webp');
    var url = await ref.getDownloadURL();
    return url;
  }
}