import 'package:crud_hive/provider/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  void saveNewTask() {
    Provider.of<Service>(context, listen: false).saveNewTask(controller.text);
    controller.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('TO DO'),
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return DialogBox(
                controller: controller,
                onSave: saveNewTask,
                onCancel: () => Navigator.of(context).pop(),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      // floatingActionButton:
      body: Consumer<Service>(
        builder: (context, db, child) {
          return ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: db.toDoList[index][0],
                taskCompleted: db.toDoList[index][1],
                onChanged: (value) => db.checkBoxChanged(value, index),
                deleteFunction: (context) => db.deleteTask(index),
                index: index,
              );
            },
          );
        },
      ),
    );
  }
}
