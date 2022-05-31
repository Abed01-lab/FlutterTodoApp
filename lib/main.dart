import 'package:flutter/material.dart';
import 'classes/todo.dart';
import './data/todos.dart';

var newPriority;
var newDescription;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final List<Todo> todos = [];

  void updateTodos() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Column editTodoContent(Todo todo) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextFormField(
            initialValue: todo.priority,
            onChanged: (value) => setState(() {
              newPriority = value;
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
              newDescription = value;
            }),
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Description'),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo App'),
          actions: [
            IconButton(
              onPressed: () {
                AlertDialog alert = AlertDialog(
                  title: const Text('Add Todo'),
                  content: Wrap(
                    children: [AddTodoContent()],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        var newTodo = Todo(
                            description: newDescription, priority: newPriority);
                        setState(() {
                          allTodos.add(newTodo);
                          newDescription = '';
                          newPriority = '';
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    )
                  ],
                );

                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    });
              },
              icon: const Icon(
                Icons.add,
              ),
            )
          ],
        ),
        body: TodoList());
  }
}

class AddTodoContent extends StatefulWidget {
  AddTodoContent({Key? key}) : super(key: key);

  @override
  State<AddTodoContent> createState() => _AddTodoContentState();
}

class _AddTodoContentState extends State<AddTodoContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextFormField(
            onChanged: (value) => setState(() {
              newPriority = value;
            }),
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Priority'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextFormField(
            onChanged: (value) => setState(() {
              newDescription = value;
            }),
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Description'),
          ),
        )
      ],
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

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
                    print(editedDescription);
                    print(editedPriority);
                    print(entry.key);
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
          Icon(Icons.more_vert),
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

List<DataColumn> getColumns(List<String> columns) {
  return columns.map((String column) {
    return DataColumn(
      label: Text(column),
    );
  }).toList();
}
