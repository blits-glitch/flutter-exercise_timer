import 'package:flutter/material.dart';
import 'package:exercise_timer/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(
      String taskName, int exerciseTime, int breakingTime, int repeatTime) {
    print('add task');
    final task = Task(
        name: taskName,
        exerciseTime: exerciseTime,
        breakingTime: breakingTime,
        repeatTime: repeatTime);
    _tasks.add(task);
    notifyListeners();
  }

  void editTask(int index, Task modifiedTask) {
    _tasks[index].editTask(modifiedTask);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
