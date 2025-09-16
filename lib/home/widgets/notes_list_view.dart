import 'package:flutter/material.dart';
import 'package:notes2_app/home/models/task.dart';
import 'package:notes2_app/home/widgets/note_tile.dart';

class TasksListView extends StatelessWidget {
  final List<Task> tasks;
  const TasksListView({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(task: tasks[index]);
        },
      ),
    );
  }
}
