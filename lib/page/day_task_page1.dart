import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wrtnm/data/database1.dart';
import 'package:wrtnm/util/dialog_box.dart';
import 'package:wrtnm/util/toto_tile.dart';

class DayTaskPage1 extends StatefulWidget {
  final String day;

  DayTaskPage1({required this.day});

  @override
  _DayTaskPageState createState() => _DayTaskPageState();
}

class _DayTaskPageState extends State<DayTaskPage1> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase1 db1 = ToDoDataBase1();

  @override
  void initState() {
    //if the app open for the first time ever
    if (_myBox.get("TODOLIST1") == null) {
      db1.createInitialData();
    } else {
      db1.loadData();
    }

    super.initState();
  }

  //controller
  final _controller = TextEditingController();

  //save new task
  void saveNewTask() {
    setState(() {
      if (_controller.text != "") {
        db1.toDoList1.add(_controller.text);
        _controller.clear();
      }
    });
    Navigator.of(context).pop();
    db1.updateDataBase();
  }

  //create New Task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete  a specific task from the list
  void deleteTask(int index) {
    setState(() {
      db1.toDoList1.removeAt(index);
    });
    db1.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: Text('Tasks for ${widget.day}'),
        backgroundColor: Color.fromARGB(255, 245, 10, 159),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db1.toDoList1.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db1.toDoList1[index],
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
