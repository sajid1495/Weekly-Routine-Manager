import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wrtnm/data/database6.dart';
import 'package:wrtnm/util/dialog_box.dart';
import 'package:wrtnm/util/toto_tile.dart';

class DayTaskPage6 extends StatefulWidget {
  final String day;

  DayTaskPage6({required this.day});

  @override
  _DayTaskPageState createState() => _DayTaskPageState();
}

class _DayTaskPageState extends State<DayTaskPage6> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase6 db6 = ToDoDataBase6();

  @override
  void initState() {
    //if the app open for the first time ever
    if (_myBox.get("TODOLIST6") == null) {
      db6.createInitialData();
    } else {
      db6.loadData();
    }

    super.initState();
  }

  //controller
  final _controller = TextEditingController();

  //save new task
  void saveNewTask() {
    setState(() {
      if (_controller.text != "") {
        db6.toDoList6.add(_controller.text);
        _controller.clear();
      }
    });
    Navigator.of(context).pop();
    db6.updateDataBase();
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
      db6.toDoList6.removeAt(index);
    });
    db6.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: Text('Tasks for ${widget.day}'),
        backgroundColor: Color.fromARGB(255, 245, 10, 159),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db6.toDoList6.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db6.toDoList6[index],
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
