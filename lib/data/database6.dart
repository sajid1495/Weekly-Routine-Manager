import 'package:hive_flutter/hive_flutter.dart';
import 'package:wrtnm/data/sortList.dart';

class ToDoDataBase6 {
  List toDoList6 = [];

  SortList SL = SortList();

  //references the box
  final _myBox6 = Hive.box('myBox');

  //run this method if the App is first time opening
  void createInitialData() {
    toDoList6 = [];
    toDoList6 = SL.sortData(toDoList6);
  }

  //load data
  void loadData() {
    toDoList6 = _myBox6.get("TODOLIST6");
    toDoList6 = SL.sortData(toDoList6);
  }

  //update data
  void updateDataBase() {
    _myBox6.put("TODOLIST6", toDoList6);
    toDoList6 = SL.sortData(toDoList6);
  }
}
