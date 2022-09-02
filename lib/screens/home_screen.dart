import 'dart:convert';

import 'package:dbtodo/models/task.dart';
import 'package:dbtodo/widgets/bottom_card.dart';
import 'package:dbtodo/widgets/rounded_flat_button.dart';
import 'package:dbtodo/widgets/rounded_text_field.dart';
import 'package:dbtodo/widgets/rounded_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:dbtodo/services/helper_functions.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

Container getGreeting() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 50),
    width: double.infinity,
    color: kSecondaryWhite,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Hello...',
          style: TextStyle(
            color: kPrimaryTextColor.withOpacity(0.7),
            fontSize: 20,
          ),
        ),
        Text(
          'Duri',
          style: TextStyle(
            color: kPrimaryTextColor,
            fontSize: 55,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

class TaskList extends StatefulWidget {
  List<Task> tasks = <Task>[];
  TaskList(this.tasks);
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = <Task>[];

  List<Widget> getTiles() {
    List<RoundedTileCard> taskTiles = [];

    for (int i = 0; i < tasks.length; i++) {
      taskTiles.add(
        RoundedTileCard(
          taskText: tasks[i].text,
        ),
      );
    }

    if (taskTiles.length > 0) {
      print(taskTiles.length);
    }
    return taskTiles;
  }

  @override
  void initState() {
    super.initState();
    tasks = widget.tasks;
  }

  // refreshList() {
  //   setState(() {
  //     tasks = dbHelper.getTasks();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 90),
        scrollDirection: Axis.vertical,
        children: getTiles(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<Task> tasks = <Task>[];
  bool isUpdating;

  @override
  void initState() {
    super.initState();
    isUpdating = false;
    getTasks();
    setState(() {});
  }

  Map data;
  List taskData;

  Future<int> getTasks() async {
    isUpdating = true;
    http.Response response = await http.get("http://192.168.0.118:3000/tasks");

    if (response.statusCode == 200) {
      taskData = json.decode(response.body);

      tasks.clear();
      isUpdating = false;
      print('IT STARTD');
      print(taskData);
      for (int i = 0; i < taskData.length; i++) {
        tasks.add(Task.fromMap(taskData[i]));
      }

      CConst.baseID = taskData.length - 1;
      print('it ended');
      setState(() {});
    } else {
      print('after the stupid request');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  saveTask(String strText, bool isDone) async {
    String url = 'http://192.168.0.118:3000/tasks/';
    Map<String, String> headers = {
      "content-type": "application/json",
    };

    var response = await http.post(
      Uri.encodeFull(url),
      body: json.encode({
        "valueID": "${CConst.baseID}",
        "isDone": "${false}",
        "strText": strText
      }),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return response.statusCode;
    }

    print('after the stupid request');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  deleteTask(String id) async {
    String url = 'http://192.168.0.118:3000/tasks/${id}';
    Map<String, String> headers = {
      "content-type": "application/json",
    };

    var response = await http.delete(
      Uri.encodeFull(url),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return response.statusCode;
    }

    print('after the stupid request');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  Future<void> refreshList() async {
    await getTasks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                color: kPrimaryWhite,
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    getGreeting(),
                    Expanded(
                      child: ListView.custom(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 100),
                        childrenDelegate: SliverChildBuilderDelegate(
                          (BuildContext ctx, int index) {
                            return Dismissible(
                              key: ValueKey(index),
                              onDismissed: (dir) {
                                setState(() {
                                  tasks.removeAt(index);
                                });
                              },
                              child: RoundedTileCard(
                                taskText: taskData[index]['strText'],
                                callback: (String value) async {
                                  Task taskToRemove;

                                  for (int i = 0; i < tasks.length; i++) {
                                    if (tasks[i].text == value) {
                                      taskToRemove = tasks[i];
                                      tasks.removeAt(i);
                                      break;
                                    }
                                  }

                                  deleteTask(taskToRemove.id);
                                  setState(() {
                                    getTasks();
                                  });
                                },
                              ),
                            );
                          },
                          childCount: taskData.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FloatingBottomCard(
                (String value) async {
                  setState(() {
                    getTasks();
                  });
                  var response = await saveTask(value, false);

                  if (response == 200) {
                    await getTasks();
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FloatingBottomCard extends StatelessWidget {
  final Function addTaskCallBack;
  String taskText;

  FloatingBottomCard(this.addTaskCallBack);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        0,
        MediaQuery.of(context).size.height -
            (MediaQuery.of(context).size.height / 9),
      ),
      child: BottomCard(
        child: Center(
          child: null,
        ),
        height: MediaQuery.of(context).size.height / 10,
        icon: Icons.add,
        onPressed: () {
          showModalBottomSheet<dynamic>(
            isDismissible: false,
            isScrollControlled: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            backgroundColor: kSecondaryWhite,
            context: context,
            builder: (context) => Wrap(
              children: <Widget>[
                BottomCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Spacer(flex: 2),
                      getStartedText(kPrimaryWhite, 'Add A Task'),
                      Spacer(flex: 2),
                      RoundedTextField(
                        hinttext: 'Enter A Task',
                        onChanged: (value) {
                          taskText = value;
                        },
                      ),
                      Spacer(flex: 2),
                      RoundedFlatButton(
                        text: 'Add A Task',
                        color: kSecondaryAccentColor,
                        onPressed: () {
                          addTaskCallBack(taskText);
                          Navigator.pop(context);
                        },
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height / 2,
                  icon: Icons.clear,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
