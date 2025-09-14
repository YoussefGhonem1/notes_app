import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes2_app/home/models/task.dart';

class TaskProvider extends ChangeNotifier {
  static const String _boxName = "tasksBox";

  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> getTasks() async {
    final box = await Hive.openBox<Task>(_boxName);
    _tasks = box.values.toList();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    final box = await Hive.openBox<Task>(_boxName);
    await box.add(task);
    _tasks = box.values.toList();
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
}