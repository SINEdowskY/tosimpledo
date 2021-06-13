import 'package:flutter/material.dart';
import 'package:tosimpledo/task.dart';
import 'package:tosimpledo/db/db.dart';

class AddTaskForm extends StatefulWidget {
  AddTaskForm();
  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  String? description;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration:
                  InputDecoration(hintText: 'Enter title', labelText: 'Title'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'kurwa pisz tu';
                }
                return null;
              },
              onSaved: (value) {
                title = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Enter description', labelText: 'Description'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'kurwa pisz tu';
                }
                return null;
              },
              onSaved: (value) {
                description = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  return;
                }

                _formKey.currentState!.save();

                Navigator.pop(context);
              },
              child: Text('Submit'),
            )
          ],
        ));
  }
}
