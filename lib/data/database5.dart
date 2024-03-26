import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase5 {
  List toDoList5 = [];
  //references the box
  final _myBox5 = Hive.box('myBox');
  //run this method if the App is first time opening
  void createInitialData() {
    toDoList5 = [];
  }

  //load data
  void loadData() {
    toDoList5 = _myBox5.get("TODOLIST5");
  }

  //update data
  void updateDataBase() {
    _myBox5.put("TODOLIST5", toDoList5);
  }
}
