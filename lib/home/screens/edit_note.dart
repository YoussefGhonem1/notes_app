import 'package:flutter/material.dart';
import 'package:notes2_app/home/models/task.dart';
import 'package:notes2_app/home/provider/task_provider.dart';
import 'package:provider/provider.dart';

class EditTask extends StatelessWidget {
  final Task task;

  const EditTask({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(
      text: task.title,
    );
    TextEditingController contentController = TextEditingController(
      text: task.content,
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "تعديل المهمة",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (titleController.text.isNotEmpty) {
                task.title = titleController.text;
                task.content = contentController.text;
                task.save();
                Provider.of<TaskProvider>(context, listen: false).getTasks();
                Navigator.pop(context);
              }
            },
            child: const Text(
              "تحديث",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'عنوان المهمة',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                labelText: 'تفاصيل المهمة',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
