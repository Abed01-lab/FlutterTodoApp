import 'package:flutter/material.dart';
import 'classes/todo.dart';
import './data/todos.dart';
import './data/priorities.dart';
import 'Components/todolist.dart';

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
      home: const HomePage(),
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
  Color? addColor = const Color.fromARGB(255, 185, 125, 34);
  String newPriority = '';
  String newDescription = '';
  int currentIndex = 0;
  Column addTodoContent() {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            side: const BorderSide(color: Colors.green)))),
                onPressed: () {},
                child: const Text('Low'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.yellow),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      side: const BorderSide(color: Colors.yellow),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text('Medium'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      side: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text('High'),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextFormField(
            onChanged: (value) => setState(() => newDescription = value),
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Description'),
          ),
        ),
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
            color: addColor,
            onPressed: () {
              AlertDialog alert = AlertDialog(
                backgroundColor: addColor,
                title: const Text('Add Todo'),
                content: Wrap(
                  children: [addTodoContent()],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (newDescription != '' || newPriority != '') {
                        var newTodo = Todo(
                            description: newDescription, priority: newPriority);
                        setState(() {
                          allTodos.add(newTodo);
                          newDescription = '';
                          newPriority = '';
                        });
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.white),
                    ),
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
      body: TodoList(todos: allTodos),
    );
  }
}
