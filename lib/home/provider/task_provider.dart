import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes2_app/home/models/task.dart';

class TaskProvider extends ChangeNotifier {
  static const String _boxName = "tasksBox";

  List<Task> _tasks = [];
  List<Task> _filteredTasks = [];

  List<Task> get tasks => _tasks;
  List<Task> get filteredTasks => _filteredTasks;

  Future<void> getTasks() async {
    final box = await Hive.openBox<Task>(_boxName);
    _tasks = box.values.toList();
    _filteredTasks = _tasks;
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    final box = await Hive.openBox<Task>(_boxName);
    await box.add(task);
    getTasks();
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    await task.delete();
    getTasks();
  }

  Future<void> toggleTaskStatus(Task task) async {
    task.isCompleted = !task.isCompleted;
    await task.save();
    getTasks();
  }

  void filterTasks(String query) {
    if (query.isEmpty) {
      _filteredTasks = _tasks;
    } else {
      _filteredTasks = _tasks
          .where((task) =>
              task.title.toLowerCase().contains(query.toLowerCase()) ||
              task.content.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}