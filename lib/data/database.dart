import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  //references the box
  final _myBox = Hive.box('myBox');
  //run this method if the App is first time opening
  void createInitialData() {
    toDoList = [];
  }

  //load data
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update data
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
