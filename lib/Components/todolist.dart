import 'package:flutter/material.dart';
import 'package:todoapp/data/todos.dart';
import '../classes/todo.dart';

class TodoList extends StatefulWidget {
  TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  String editedDescription = '';
  String editedPriority = '';

  changeTodo(int index, String description, String priority) {
    setState(() {
      allTodos[index].description = description;
      allTodos[index].priority = priority;
    });
  }

  Column editTodoContent(Todo todo) {
    editedDescription = todo.description;
    editedPriority = todo.priority;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextFormField(
            initialValue: todo.priority,
            onChanged: (value) => setState(() {
              editedPriority = value;
            }),
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Priority'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextFormField(
            initialValue: todo.description,
            onChanged: (value) => setState(() {
              editedDescription = value;
            }),
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Description'),
          ),
        )
      ],
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
        label: Text(column),
      );
    }).toList();
  }

  List<DataRow> getRows(List<Todo> todos, BuildContext context) {
    return todos.asMap().entries.map((entry) {
      return DataRow(cells: [
        DataCell(
          Text(entry.value.priority),
        ),
        DataCell(
          Text(entry.value.description),
        ),
        DataCell(
          onTap: () {
            AlertDialog alert = AlertDialog(
              title: const Text('Add Todo'),
              content: Wrap(
                children: [editTodoContent(entry.value)],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    changeTodo(entry.key, editedDescription, editedPriority);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save Edit'),
                )
              ],
            );

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                });
          },
          const Icon(Icons.more_vert),
        ),
      ]);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final columns = ['Priority', 'Description', 'Edit'];
    return DataTable(
      columns: getColumns(columns),
      rows: getRows(allTodos, context),
    );
  }
}