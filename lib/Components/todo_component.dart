import 'package:flutter/material.dart';
import 'package:todoapp/Components/dismiss_green.dart';
import 'package:todoapp/Components/dismiss_red.dart';
import 'package:todoapp/Components/todo_content.dart';
import 'package:todoapp/db/Firebase_connection.dart';
import 'package:todoapp/Components/create_new_todo.dart';

import '../classes/todo.dart';

class TodoComponent extends StatelessWidget {
  Todo todo;
  TodoComponent({Key? key, required this.todo}) : super(key: key);

  onDismiss(DismissDirection direction, Todo todo, BuildContext context) {
    switch (direction) {
      case DismissDirection.endToStart:
        FirebaseConnection.db.doc(todo.getdocId).delete();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('You deleted the todo'),
          ),
        );
        break;
      case DismissDirection.startToEnd:
        FirebaseConnection.db.doc(todo.getdocId).delete();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('You completed the todo'),
          ),
        );
        break;
      default:
        break;
    }
  }

  onTap(BuildContext context, Todo todo) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CreateNewTodo()));
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: const DismissGreen(),
      secondaryBackground: const DismissRed(),
      onDismissed: (direction) => onDismiss(direction, todo, context),
      key: const ValueKey(Object),
      child: InkWell(
        onTap: () {},
        splashFactory: NoSplash.splashFactory,
        child: TodoContent(todoTitle: todo.getTitle),
      ),
    );
  }
}
