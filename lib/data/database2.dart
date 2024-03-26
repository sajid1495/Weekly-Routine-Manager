import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase2 {
  List toDoList2 = [];
  //references the box
  final _myBox2 = Hive.box('myBox');
  //run this method if the App is first time opening
  void createInitialData() {
    toDoList2 = [];
  }

  //load data
  void loadData() {
    toDoList2 = _myBox2.get("TODOLIST2");
  }

  //update data
  void updateDataBase() {
    _myBox2.put("TODOLIST2", toDoList2);
  }
}
