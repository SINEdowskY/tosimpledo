import 'package:flutter/material.dart';
import 'task.dart';
import 'db/db.dart';

class Tasks extends StatefulWidget {
  Tasks();
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  late List<Task> task;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container();
  }
}
