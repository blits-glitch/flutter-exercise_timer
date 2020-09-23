import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String taskName;
  final int exerciseTime;
  final int breakingTime;
  final int repeatTime;

  TaskCard(
      {this.taskName, this.exerciseTime, this.breakingTime, this.repeatTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          Text(
            taskName,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconItem(
                  icon: Icon(Icons.directions_run),
                  time: exerciseTime,
                  unit: '秒'),
              IconItem(
                icon: Icon(Icons.free_breakfast),
                time: breakingTime,
                unit: '秒',
              ),
              IconItem(
                icon: Icon(Icons.repeat),
                time: repeatTime,
                unit: '回',
              ),
            ],
          )
        ],
      ),
    );
    ;
  }
}

class IconItem extends StatelessWidget {
  final Icon icon;
  final int time;
  final String unit;

  IconItem({this.icon, this.time, this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[icon, Text('$time$unit')],
      ),
    );
    ;
  }
}
