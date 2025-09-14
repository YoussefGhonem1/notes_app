import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes2_app/home/models/task.dart';
import 'package:notes2_app/home/provider/task_provider.dart';
import 'package:notes2_app/home/screens/home_screen.dart';
import 'package:provider/provider.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'ToDo App',
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}