import 'package:flutter/material.dart';
import 'package:exercise_timer/models/task_data.dart';
import 'dart:core';
import 'package:provider/provider.dart';

class AddTaskDialog extends StatefulWidget {
  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  String taskTitle;
  int exerciseTime;
  int breakingTime;
  int repeatTime;

  bool isSet() {
    if (taskTitle == null ||
        exerciseTime == null ||
        breakingTime == null ||
        repeatTime == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('メニューの追加'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: 'トレーニングタイトル',
              ),
              onChanged: (value) {
                taskTitle = value;
              },
            ),
            AddTaskDialogTextField(
              label: '秒数',
              icon: Icon(Icons.directions_run),
              changeCallback: (value) {
                exerciseTime = int.parse(value);
              },
            ),
            AddTaskDialogTextField(
              label: '秒数',
              icon: Icon(Icons.free_breakfast),
              changeCallback: (value) {
                breakingTime = int.parse(value);
              },
            ),
            AddTaskDialogTextField(
              label: '回数',
              icon: Icon(Icons.repeat),
              changeCallback: (value) {
                repeatTime = int.parse(value);
              },
            ),
            RaisedButton(
                onPressed: () {
                  if (isSet()) {
                    Provider.of<TaskData>(context, listen: false).addTask(
                        taskTitle, exerciseTime, breakingTime, repeatTime);
                    //reset();
                    Navigator.pop(context);
                  }
                },
                child: Text('OK'))
          ],
        ),
      ),
    );
    ;
  }
}

class AddTaskDialogTextField extends StatelessWidget {
  AddTaskDialogTextField({this.label, this.icon, this.changeCallback});

  final String label;
  final Icon icon;
  final Function changeCallback;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(icon: icon, labelText: label),
      onChanged: changeCallback,
    );
  }
}
