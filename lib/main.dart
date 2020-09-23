import 'package:flutter/material.dart';
import 'package:exercise_timer/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:exercise_timer/models/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        title: 'Training Timer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => TasksScreen(),
          //'/timer': (context) => TimerScreen(),
        },
      ),
    );
  }
}
