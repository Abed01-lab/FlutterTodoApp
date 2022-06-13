import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../classes/todo.dart';
import '../data/todos.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  var priority = TextEditingController();
  String todoTitle = "";
  String todoDescription = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Todo"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: ((value) => todoTitle = value),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Todo Title")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: priority,
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) => CupertinoActionSheet(
                            title: const Text("Priority"),
                            message: const Text(
                                "Please choose the priority for this todo."),
                            actions: [
                              CupertinoActionSheetAction(
                                onPressed: () {
                                  setState(() {
                                    priority.text = "High";
                                  });
                                  Navigator.of(context).pop(context);
                                },
                                child: const Text("High"),
                              ),
                              CupertinoActionSheetAction(
                                onPressed: () {
                                  setState(() {
                                    priority.text = "Medium";
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Medium"),
                              ),
                              CupertinoActionSheetAction(
                                onPressed: () {
                                  setState(() {
                                    priority.text = "Low";
                                  });
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Low"),
                              ),
                            ]));
              },
              decoration: const InputDecoration(
                  label: Text("Todo Priority"), border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: ((value) => todoDescription = value),
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  label: Text("Todo Description"),
                  border: OutlineInputBorder()),
            ),
          ),
          TextButton(
            onPressed: () {
              if (priority.text != "" && todoTitle != ""){
                setState(() {
                Todo newTodo = Todo(description: todoTitle, priority: priority.text);
                  allTodos.add(newTodo);
                });
                Navigator.of(context).pop(context);
              }
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }
}
