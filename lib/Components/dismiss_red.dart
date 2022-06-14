import 'package:flutter/material.dart';

class DismissRed extends StatelessWidget {
  const DismissRed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      alignment: Alignment.centerRight,
      color: Colors.red,
      child: const Icon(Icons.delete_forever),
    );
  }
}
