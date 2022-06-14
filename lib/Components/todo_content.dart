import 'package:flutter/material.dart';

class TodoContent extends StatelessWidget {
  String todoTitle;
  TodoContent({Key? key, required this.todoTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(todoTitle),
        ),
        const SizedBox(height: 15),
        const Divider(thickness: 2, height: 0),
      ],
    );
  }
}
