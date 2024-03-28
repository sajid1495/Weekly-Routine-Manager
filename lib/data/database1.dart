import 'package:hive_flutter/hive_flutter.dart';
import 'package:wrtnm/data/sortList.dart';

class ToDoDataBase1 {
  List toDoList1 = [];

  SortList SL = SortList();

  //references the box
  final _myBox1 = Hive.box('myBox');

  //run this method if the App is first time opening
  void createInitialData() {
    toDoList1 = [];
    toDoList1 = SL.sortData(toDoList1);
  }

  //load data
  void loadData() {
    toDoList1 = _myBox1.get("TODOLIST1");
    toDoList1 = SL.sortData(toDoList1);
  }

  //update data
  void updateDataBase() {
    _myBox1.put("TODOLIST1", toDoList1);
    toDoList1 = SL.sortData(toDoList1);
  }
}
