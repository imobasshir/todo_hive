import 'package:flutter/material.dart';
import 'package:crud_hive/util/text_next.dart';

class NextPage extends StatelessWidget {
  const NextPage({
    Key? key,
    required this.taskName,
  }) : super(key: key);
  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('NOTES'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextNext(taskName: taskName),
        ],
      ),
    );
  }
}
