import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wrtnm/data/database4.dart';
import 'package:wrtnm/util/dialog_box.dart';
import 'package:wrtnm/util/toto_tile.dart';

class DayTaskPage4 extends StatefulWidget {
  final String day;

  DayTaskPage4({required this.day});

  @override
  _DayTaskPageState createState() => _DayTaskPageState();
}

class _DayTaskPageState extends State<DayTaskPage4> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase4 db4 = ToDoDataBase4();

  @override
  void initState() {
    //if the app open for the first time ever
    if (_myBox.get("TODOLIST4") == null) {
      db4.createInitialData();
    } else {
      db4.loadData();
    }

    super.initState();
  }

  //controller
  final _controller = TextEditingController();

  //save new task
  void saveNewTask() {
    setState(() {
      if (_controller.text != "") {
        db4.toDoList4.add(_controller.text);
        _controller.clear();
      }
    });
    Navigator.of(context).pop();
    db4.updateDataBase();
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
      db4.toDoList4.removeAt(index);
    });
    db4.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        title: Text('Tasks for ${widget.day}'),
        backgroundColor: Color.fromARGB(255, 245, 10, 159),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db4.toDoList4.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db4.toDoList4[index],
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
