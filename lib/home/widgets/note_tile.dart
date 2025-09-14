import 'package:flutter/material.dart';
import 'package:notes2_app/home/models/task.dart';
import 'package:notes2_app/home/provider/task_provider.dart';
import 'package:notes2_app/home/screens/task_details_screen.dart';
import 'package:notes2_app/home/widgets/button_sheet.dart';
import 'package:provider/provider.dart';


class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TaskDetailsScreen(task: task))),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        tileColor: Colors.white,
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            Provider.of<TaskProvider>(context, listen: false)
                .toggleTaskStatus(task);
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => NoteOptionsSheet(task: task,),
            );
          },
        ),
      ),
    );
  }
}