import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wrtnm/data/database3.dart';
import 'package:wrtnm/util/dialog_box.dart';
import 'package:wrtnm/util/toto_tile.dart';

class DayTaskPage3 extends StatefulWidget {
  final String day;

  DayTaskPage3({required this.day});

  @override
  _DayTaskPageState createState() => _DayTaskPageState();
}

class _DayTaskPageState extends State<DayTaskPage3> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase3 db3 = ToDoDataBase3();

  @override
  void initState() {
    //if the app open for the first time ever
    if (_myBox.get("TODOLIST3") == null) {
      db3.createInitialData();
    } else {
      db3.loadData();
    }

    super.initState();
  }

  //controller
  final _controller = TextEditingController();

  //save new task
  void saveNewTask() {
    setState(() {
      if (_controller.text != "") {
        db3.toDoList3.add(_controller.text);
        _controller.clear();
      }
    });
    Navigator.of(context).pop();
    db3.updateDataBase();
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
      db3.toDoList3.removeAt(index);
    });
    db3.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text('Tasks for ${widget.day}'),
        backgroundColor: Color.fromARGB(255, 245, 10, 159),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db3.toDoList3.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db3.toDoList3[index],
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
