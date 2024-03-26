import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wrtnm/data/database.dart';
import 'package:wrtnm/util/dialog_box.dart';
import 'package:wrtnm/util/toto_tile.dart';

class DayTaskPage extends StatefulWidget {
  final String day;

  DayTaskPage({required this.day});

  @override
  _DayTaskPageState createState() => _DayTaskPageState();
}

class _DayTaskPageState extends State<DayTaskPage> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    //if the app open for the first time ever
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  //controller
  final _controller = TextEditingController();

  //save new task
  void saveNewTask() {
    setState(() {
      if (_controller.text != "") {
        db.toDoList.add(_controller.text);
        _controller.clear();
      }
    });
    Navigator.of(context).pop();
    db.updateDataBase();
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
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('Tasks for ${widget.day}'),
        backgroundColor: Color.fromARGB(255, 245, 10, 159),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index],
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
