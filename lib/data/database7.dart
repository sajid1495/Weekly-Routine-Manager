import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase7 {
  List toDoList7 = [];
  //references the box
  final _myBox7 = Hive.box('myBox');
  //run this method if the App is first time opening
  void createInitialData() {
    toDoList7 = [];
  }

  //load data
  void loadData() {
    toDoList7 = _myBox7.get("TODOLIST7");
  }

  //update data
  void updateDataBase() {
    _myBox7.put("TODOLIST7", toDoList7);
  }
}
