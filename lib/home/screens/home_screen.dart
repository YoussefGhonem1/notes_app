import 'package:flutter/material.dart';
import 'package:notes2_app/home/provider/task_provider.dart';
import 'package:notes2_app/home/screens/add_note.dart';
import 'package:notes2_app/home/widgets/empty_notes.dart';
import 'package:notes2_app/home/widgets/notes_list_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TaskProvider>(context, listen: false).getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      "ملاحظاتى",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "ابحث عن ملاحظات...",
                        hintStyle: const TextStyle(color: Colors.purple),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.purple,
                        ),
                        fillColor: Colors.blueGrey[100],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.purple),
                    ),
                  ],
                ),
              ),
              taskProvider.tasks.isEmpty
                  ? EmptyTasks()
                  : TasksListView(tasks: taskProvider.tasks),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const AddTask()));
        },
        child: Icon(Icons.add, color: Colors.blueGrey[100]),
      ),
    );
  }
}
