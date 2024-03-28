import 'package:hive_flutter/hive_flutter.dart';
import 'package:wrtnm/data/sortList.dart';

class ToDoDataBase4 {
  List toDoList4 = [];

  SortList SL = SortList();

  //references the box
  final _myBox4 = Hive.box('myBox');

  //run this method if the App is first time opening
  void createInitialData() {
    toDoList4 = [];
    toDoList4 = SL.sortData(toDoList4);
  }

  //load data
  void loadData() {
    toDoList4 = _myBox4.get("TODOLIST4");
    toDoList4 = SL.sortData(toDoList4);
  }

  //update data
  void updateDataBase() {
    _myBox4.put("TODOLIST4", toDoList4);
    toDoList4 = SL.sortData(toDoList4);
  }
}
