import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Components/todo_component.dart';
import 'package:todoapp/classes/todo.dart';

class TodoList extends StatelessWidget {
  AsyncSnapshot<QuerySnapshot> snapshot;
  TodoList({Key? key, required this.snapshot}) : super(key: key);

  List<Widget> makeListTiles(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data!.docs
        .map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          if (data.isNotEmpty) {
            return TodoComponent(
                todo: Todo(
                    description: data['todoDescription'],
                    priority: data['todoPriority'],
                    title: data['todoTitle'],
                    docId: document.id));
          }
        })
        .toList()
        .cast();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: makeListTiles(snapshot),
    );
  }
}
