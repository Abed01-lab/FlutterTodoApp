import 'package:flutter/material.dart';
import 'package:todoapp/Components/todo_choices.dart';
import 'package:todoapp/Components/todo_text_field.dart';
import 'package:todoapp/classes/todo.dart';
import 'package:todoapp/db/Firebase_connection.dart';

class CreateNewTodo extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  int priority = 0;
  CreateNewTodo({
    Key? key,
  }) : super(key: key);

  addToDatabase(BuildContext context) {
    if (title.text == "" || description.text == "" || priority == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.yellow,
          content: Text('You have not filled out everything.'),
        ),
      );
    } else {
      Todo todo = Todo(
          description: description.text,
          priority: priority,
          title: title.text,
          docId: "");
      FirebaseConnection.db.add(todo.toFirestore());
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Todo'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            TodoTextField(
              label: 'Todo Title',
              textController: title,
            ),
            TodoChoices(currentChoice: priority),
            TodoTextField(
              label: 'Todo Description',
              textController: description,
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () => addToDatabase(context),
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}
