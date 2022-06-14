import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Components/create_new_todo.dart';
import '../Components/todo_list.dart';
import '../classes/todo.dart';

class TodoListBuilder extends StatefulWidget {
  const TodoListBuilder({Key? key}) : super(key: key);

  @override
  State<TodoListBuilder> createState() => _TodoListBuilderState();
}

class _TodoListBuilderState extends State<TodoListBuilder> {
  final db = FirebaseFirestore.instance.collection('todos');

  final Stream<QuerySnapshot> readTodos =
      FirebaseFirestore.instance.collection('todos').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: readTodos,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.active) {
          return TodoList(snapshot: snapshot);
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
