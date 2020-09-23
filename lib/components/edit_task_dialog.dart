import 'package:flutter/material.dart';
import 'package:exercise_timer/models/task.dart';

class EditTaskDialog extends StatefulWidget {
  final Task task;

  EditTaskDialog({this.task});

  @override
  _EditTaskDialogState createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  Task beforeTask;
  Task editingTask;

  bool isOK() {
    if (editingTask.name == null ||
        editingTask.exerciseTime == null ||
        editingTask.breakingTime == null ||
        editingTask.repeatTime == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    beforeTask = widget.task; //[注意]ポインタを渡してるだけで同じもの、いらないかも
    editingTask = Task(
        name: beforeTask.name,
        exerciseTime: beforeTask.exerciseTime,
        breakingTime: beforeTask.breakingTime,
        repeatTime: beforeTask.repeatTime);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('トレーニングの編集'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            EditTaskDialogTextField(
              taskValue: editingTask.exerciseTime,
              label: '秒数',
              icon: Icon(Icons.directions_run),
              callback: (value) {
                editingTask.exerciseTime = int.parse(value);
              },
            ),
            EditTaskDialogTextField(
              taskValue: editingTask.breakingTime,
              label: '秒数',
              icon: Icon(Icons.free_breakfast),
              callback: (value) {
                editingTask.breakingTime = int.parse(value);
              },
            ),
            EditTaskDialogTextField(
              taskValue: editingTask.repeatTime,
              label: '回数',
              icon: Icon(Icons.repeat),
              callback: (value) {
                editingTask.repeatTime = int.parse(value);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () {
                    if (isOK()) {
                      Navigator.pop(context, editingTask);
                    }
                  },
                  child: Text('編集'),
                ),
                RaisedButton(
                  onPressed: () {
                    //削除するメソッド
                  },
                  child: Text('削除'),
                ),
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}

class EditTaskDialogTextField extends StatefulWidget {
  EditTaskDialogTextField(
      {this.taskValue, this.label, this.icon, this.callback});

  final int taskValue;
  final String label;
  final Icon icon;
  final Function callback;

  @override
  _EditTaskDialogTextFieldState createState() =>
      _EditTaskDialogTextFieldState();
}

class _EditTaskDialogTextFieldState extends State<EditTaskDialogTextField> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController =
        TextEditingController(text: widget.taskValue.toString());
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(icon: widget.icon, labelText: widget.label),
      onChanged: widget.callback,
    );
  }
}
