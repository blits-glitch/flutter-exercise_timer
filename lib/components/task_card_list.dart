import 'package:flutter/material.dart';
import 'package:exercise_timer/components/task_card.dart';
import 'package:provider/provider.dart';
import 'package:exercise_timer/models/task.dart';
import 'package:exercise_timer/models/task_data.dart';
import 'package:exercise_timer/components/edit_task_dialog.dart';

class TaskCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return GestureDetector(
              onTap: () async {
                Task modifiedTask = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return EditTaskDialog(task: taskData.tasks[index]);
                    });
                taskData.editTask(index, modifiedTask);
              },
              child: TaskCard(
                taskName: task.name,
                exerciseTime: task.exerciseTime,
                breakingTime: task.breakingTime,
                repeatTime: task.repeatTime,
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
