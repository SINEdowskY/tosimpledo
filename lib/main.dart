import 'package:flutter/material.dart';
import 'TaskCreation/addTask.dart';
import 'tasks.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToSimpleDo'),
        leadingWidth: 100,
      ),
      body: Tasks(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTask()),
          );
        },
      ),
    );
  }
}
