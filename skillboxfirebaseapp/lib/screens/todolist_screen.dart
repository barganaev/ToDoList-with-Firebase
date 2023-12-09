import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skillboxfirebaseapp/screens/settings_screen.dart';
import 'package:skillboxfirebaseapp/services/database.dart';
import 'package:skillboxfirebaseapp/widgets/alert_dialog_widget.dart';
import 'package:skillboxfirebaseapp/widgets/new_task.dart';
import 'package:skillboxfirebaseapp/model/todo_task_model.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  void delayy() async {
    await Future.delayed(
      const Duration(seconds: 10)
    );
    const CircularProgressIndicator();
  }

  List<bool> _isChosen = [];
  List prod = [];

  @override
  void initState() {
    super.initState();
    // prod = Database.getTask();
    delayy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: Stack(
        children: [

          // Background Image
          FutureBuilder<String>(
            future: Database.getImage(),
            // future: FirebaseFirestore.instance.collection('store_collection').doc('exp53').get(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('Connection State in NONE!');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  // return const Text('Awaiting result...');
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  return Container(
                    alignment: Alignment.bottomCenter,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.7,
                    // height: double.infinity,
                    child: Image.network(
                      '${snapshot.data}',
                      fit: BoxFit.fill,
                    )
                  );
              }
            }
          ),

          // ToDoList tasks
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('store_collection').snapshots(),
            builder: (context, snapshot) {
              // prod = snapshot.data!.docs;
              if (snapshot.hasData) {
                prod = snapshot.data!.docs;
                _isChosen = List<bool>.filled(prod.length, false);
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: ValueKey<QueryDocumentSnapshot>(snapshot.data!.docs[index]),
                          onDismissed: (DismissDirection direction) {
                            setState(() {
                              Database.deleteTask('${snapshot.data?.docs[index].reference.id}');
                            });
                          },
                          child: Card(
                            child: CheckboxListTile(
                              title: Text(
                                '${snapshot.data?.docs[index]['name']}',
                                style: const TextStyle(
                                  decoration: TextDecoration.none
                                ),
                              ),
                              subtitle: Text('${snapshot.data?.docs[index]['color']}'),
                              value: _isChosen[index],
                                onChanged: (newValue) {
                                    _isChosen[index] = newValue!;
                                    print(_isChosen[index]);
                                  setState(() {});
                                },
                          
                                controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          )
                          // newTask(
                          //   snapshot.data?.docs[index]['name'], 
                          //   snapshot.data?.docs[index]['color'], 
                          //   setState,
                          //   _isDone,
                          //   index
                          // ),
                        );
                      }
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context, 
            builder: (BuildContext context) {
              return alertDialog(context);
            }
          );
        },
      ),
    );
  }
}
