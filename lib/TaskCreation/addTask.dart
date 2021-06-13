import 'package:flutter/material.dart';
import 'package:tosimpledo/TaskCreation/addTaskForm.dart';

class AddTask extends StatelessWidget {
  AddTask();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Task"),
        ),
        body: AddTaskForm());
  }
}
