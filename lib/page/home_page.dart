import 'package:flutter/material.dart';
import 'package:wrtnm/page/day_task_page1.dart';
import 'package:wrtnm/page/day_task_page2.dart';
import 'package:wrtnm/page/day_task_page3.dart';
import 'package:wrtnm/page/day_task_page4.dart';
import 'package:wrtnm/page/day_task_page5.dart';
import 'package:wrtnm/page/day_task_page6.dart';
import 'package:wrtnm/page/day_task_page7.dart';

class HomePage extends StatelessWidget {
  List<String> days = [
    "Saturday",
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday"
  ];

  // Define a list of colors for tile backgrounds
  List<Color> tileColors = [
    Color.fromARGB(255, 247, 227, 45),
    Colors.green,
    Colors.blue,
    Color.fromARGB(255, 240, 76, 73),
    Colors.orange,
    Colors.purple,
    Color.fromARGB(255, 245, 10, 159),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text('WEEKLY ROUTINE MANAGER'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemCount: days.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(
                10.0), // Add vertical space between each tile
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: tileColors[index % tileColors.length],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      days[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DayTaskPage1(day: days[index]),
                      ),
                    );
                  }
                  if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DayTaskPage2(day: days[index]),
                      ),
                    );
                  }
                  if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DayTaskPage3(day: days[index]),
                      ),
                    );
                  }
                  if (index == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DayTaskPage4(day: days[index]),
                      ),
                    );
                  }
                  if (index == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DayTaskPage5(day: days[index]),
                      ),
                    );
                  }
                  if (index == 5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DayTaskPage6(day: days[index]),
                      ),
                    );
                  }
                  if (index == 6) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DayTaskPage7(day: days[index]),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
