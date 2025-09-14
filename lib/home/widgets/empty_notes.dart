import 'package:flutter/material.dart';
import 'package:notes2_app/home/screens/add_note.dart';

class EmptyTasks extends StatelessWidget {
  const EmptyTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("لا توجد مهام حاليًا"),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddTask()));
            },
            child: const Text("إضافة مهمة جديدة"),
          ),
        ],
      ),
    );
  }
}