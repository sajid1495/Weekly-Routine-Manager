import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wrtnm/data/database2.dart';
import 'package:wrtnm/util/dialog_box.dart';
import 'package:wrtnm/util/toto_tile.dart';

class DayTaskPage2 extends StatefulWidget {
  final String day;

  DayTaskPage2({required this.day});

  @override
  _DayTaskPageState createState() => _DayTaskPageState();
}

class _DayTaskPageState extends State<DayTaskPage2> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase2 db2 = ToDoDataBase2();

  @override
  void initState() {
    //if the app open for the first time ever
    if (_myBox.get("TODOLIST2") == null) {
      db2.createInitialData();
    } else {
      db2.loadData();
    }

    super.initState();
  }

  //controller
  final _controller = TextEditingController();

  //save new task
  void saveNewTask() {
    setState(() {
      if (_controller.text != "") {
        db2.toDoList2.add(_controller.text);
        _controller.clear();
      }
    });
    Navigator.of(context).pop();
    db2.updateDataBase();
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
      db2.toDoList2.removeAt(index);
    });
    db2.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text('Tasks for ${widget.day}'),
        backgroundColor: Color.fromARGB(255, 245, 10, 159),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db2.toDoList2.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db2.toDoList2[index],
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
