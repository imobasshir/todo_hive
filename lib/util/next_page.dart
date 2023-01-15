import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:crud_hive/provider/service.dart';
import 'package:crud_hive/util/dialog_box.dart';
import 'package:crud_hive/util/text_next.dart';

class NextPage extends StatelessWidget {
  const NextPage({
    Key? key,
    required this.taskName,
    required this.index,
  }) : super(key: key);
  final String taskName;
  final int index;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Service>(context, listen: false);
    final controller = TextEditingController(text: prov.toDoList[index][0]);

    void updateTask() {
      Provider.of<Service>(context, listen: false)
          .updateTask(index, controller.text);
      Navigator.of(context).pop();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('NOTES'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DialogBox(
                    controller: controller,
                    onSave: updateTask,
                    onCancel: () => Navigator.of(context).pop(),
                  );
                },
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Service>(
            builder: (context, db, child) {
              return TextNext(taskName: db.toDoList[index][0]);
            },
          ),
        ],
      ),
    );
  }
}
