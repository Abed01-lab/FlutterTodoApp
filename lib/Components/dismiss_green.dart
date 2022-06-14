import 'package:flutter/material.dart';

class DismissGreen extends StatelessWidget {
  const DismissGreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      alignment: Alignment.centerLeft,
      color: Colors.green,
      child: const Icon(Icons.check_circle),
    );
  }
}
