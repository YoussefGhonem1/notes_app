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
          const SizedBox(height: 280),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blueGrey[200],
            child: Icon(Icons.library_add, size: 60, color: Colors.purple),
          ),
          const SizedBox(height: 12),
          const Text(
            "لا توجد ملاحظات حاليًا",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => const AddTask()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple),
            ),
            child: const Text(
              "إضافة مهمة جديدة",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
