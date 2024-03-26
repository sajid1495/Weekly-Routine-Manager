import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wrtnm/data/database7.dart';
import 'package:wrtnm/util/dialog_box.dart';
import 'package:wrtnm/util/toto_tile.dart';

class DayTaskPage7 extends StatefulWidget {
  final String day;

  DayTaskPage7({required this.day});

  @override
  _DayTaskPageState createState() => _DayTaskPageState();
}

class _DayTaskPageState extends State<DayTaskPage7> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase7 db7 = ToDoDataBase7();

  @override
  void initState() {
    //if the app open for the first time ever
    if (_myBox.get("TODOLIST7") == null) {
      db7.createInitialData();
    } else {
      db7.loadData();
    }

    super.initState();
  }

  //controller
  final _controller = TextEditingController();

  //save new task
  void saveNewTask() {
    setState(() {
      if (_controller.text != "") {
        db7.toDoList7.add(_controller.text);
        _controller.clear();
      }
    });
    Navigator.of(context).pop();
    db7.updateDataBase();
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
      db7.toDoList7.removeAt(index);
    });
    db7.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      appBar: AppBar(
        title: Text('Tasks for ${widget.day}'),
        backgroundColor: Color.fromARGB(255, 245, 10, 159),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db7.toDoList7.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db7.toDoList7[index],
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
