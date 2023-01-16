import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Service extends ChangeNotifier {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  // build context
  BuildContext context;

  Service(
    this.context,
  ) {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      createInitialData();
      notifyListeners();
    } else {
      // there already exists data
      loadData();
      notifyListeners();
    }
  }

  List _toDoList = [];

  // get list of tasks
  List get toDoList => _toDoList;

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    _toDoList = [
      ["Complete Your Work", false],
      ["Do Exercise", false],
    ];
  }

  // load the data from database
  void loadData() {
    _toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", _toDoList);
    notifyListeners();
  }

  // save new task
  void saveNewTask(String text) {
    _toDoList.add([text, false]);
    notifyListeners();
    updateDataBase();
  }

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    _toDoList[index][1] = !_toDoList[index][1];
    notifyListeners();
    updateDataBase();
  }

  // delete task
  void deleteTask(int index) {
    _toDoList.removeAt(index);
    notifyListeners();
    updateDataBase();
  }

  // update task
  void updateTask(int index, String text) {
    _toDoList[index][0] = text;
    notifyListeners();
    updateDataBase();
  }
}
