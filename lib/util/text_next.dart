import 'package:flutter/material.dart';

class TextNext extends StatelessWidget {
  const TextNext({
    Key? key,
    required this.taskName,
  }) : super(key: key);
  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          taskName,
          textScaleFactor: 1.2,
        ),
      ),
    );
  }
}
