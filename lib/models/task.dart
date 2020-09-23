import 'package:flutter/material.dart';

class Task {
  String name;
  int exerciseTime;
  int breakingTime;
  int repeatTime;

  Task(
      {@required this.name,
      @required this.exerciseTime,
      @required this.breakingTime,
      @required this.repeatTime});

  void editTask(Task modifiedTask) {
    this.name = modifiedTask.name;
    this.exerciseTime = modifiedTask.exerciseTime;
    this.breakingTime = modifiedTask.breakingTime;
    this.repeatTime = modifiedTask.repeatTime;
  }
}
