import 'package:flutter/material.dart';
import 'package:notes2_app/home/models/task.dart';
import 'package:notes2_app/home/screens/task_details_screen.dart';
import 'package:notes2_app/home/widgets/button_sheet.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetailsScreen(task: task),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        tileColor: Colors.white,
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.purple,
          child: Icon(Icons.library_add, size: 25, color: Colors.blueGrey[100]),
        ),
        title: Text(task.title),
        subtitle: Text(task.content),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => NoteOptionsSheet(task: task),
            );
          },
        ),
      ),
    );
  }
}
