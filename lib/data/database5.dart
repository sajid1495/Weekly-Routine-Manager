import 'package:hive_flutter/hive_flutter.dart';
import 'package:wrtnm/data/sortList.dart';

class ToDoDataBase5 {
  List toDoList5 = [];

  SortList SL = SortList();

  //references the box
  final _myBox5 = Hive.box('myBox');

  //run this method if the App is first time opening
  void createInitialData() {
    toDoList5 = [];
    toDoList5 = SL.sortData(toDoList5);
  }

  //load data
  void loadData() {
    toDoList5 = _myBox5.get("TODOLIST5");
    toDoList5 = SL.sortData(toDoList5);
  }

  //update data
  void updateDataBase() {
    _myBox5.put("TODOLIST5", toDoList5);
    toDoList5 = SL.sortData(toDoList5);
  }
}
