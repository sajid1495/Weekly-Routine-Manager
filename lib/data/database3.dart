import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase3 {
  List toDoList3 = [];
  //references the box
  final _myBox3 = Hive.box('myBox');
  //run this method if the App is first time opening
  void createInitialData() {
    toDoList3 = [];
  }

  //load data
  void loadData() {
    toDoList3 = _myBox3.get("TODOLIST3");
  }

  //update data
  void updateDataBase() {
    _myBox3.put("TODOLIST3", toDoList3);
  }
}
