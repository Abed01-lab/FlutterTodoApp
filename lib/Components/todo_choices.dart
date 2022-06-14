import 'package:flutter/material.dart';

class TodoChoices extends StatefulWidget {
  int currentChoice;
  TodoChoices({Key? key, required this.currentChoice}) : super(key: key);

  @override
  State<TodoChoices> createState() => _TodoChoicesState();
}

class _TodoChoicesState extends State<TodoChoices> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ChoiceChip(
              label: const Text('High'),
              selected: widget.currentChoice == 1,
              onSelected: (bool selected) {
                setState(() {
                  widget.currentChoice = selected ? 1 : 0;
                });
              },
            ),
            ChoiceChip(
              label: const Text('Medium'),
              selected: widget.currentChoice == 2,
              onSelected: (bool selected) {
                setState(() {
                  widget.currentChoice = selected ? 2 : 0;
                });
              },
            ),
            ChoiceChip(
              label: const Text('Low'),
              selected: widget.currentChoice == 3,
              onSelected: (bool selected) {
                setState(() {
                  widget.currentChoice = selected ? 3 : 0;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
