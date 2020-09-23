import 'package:flutter/material.dart';
import 'package:exercise_timer/components/task_card_list.dart';
import 'package:exercise_timer/components/add_task_dialog.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void addTaskCard() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('タイマー'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddTaskDialog();
              });
          //addTrainingCard();
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: TaskCardList(),
            ),
            Align(
              child: RaisedButton(
                elevation: 16.0,
                child: Text("Test Start"),
                onPressed: () {
                  // for (Map trainingTimer in trainingTimers) {
                  //   print(trainingTimer);
                  // }
                  // if (trainingTimers.length != 0) {
                  //   Navigator.pushNamed(context, '/timer',
                  //       arguments: trainingTimers);
                  // }
                },
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
