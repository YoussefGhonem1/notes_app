import 'package:flutter/material.dart';
import 'package:notes2_app/home/models/task.dart';
import 'package:notes2_app/home/provider/task_provider.dart';
import 'package:notes2_app/home/screens/edit_note.dart';
import 'package:provider/provider.dart';


class NoteOptionsSheet extends StatelessWidget {
  final Task task;
  const NoteOptionsSheet({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('تعديل'),
          onTap: () {
            Navigator.pop(context); 
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditTask(task: task),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.delete),
          title: const Text('حذف'),
          onTap: () {
            Provider.of<TaskProvider>(context, listen: false).deleteTask(task);
            Navigator.pop(context); // Close the bottom sheet
          },
        ),
      ],
    );
  }
}