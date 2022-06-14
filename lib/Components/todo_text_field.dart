import 'package:flutter/material.dart';

class TodoTextField extends StatelessWidget {
  String label;
  TextEditingController textController;
  TodoTextField({Key? key, required this.label, required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      controller: textController,
      decoration: InputDecoration(label: Text(label)),
    );
  }
}
