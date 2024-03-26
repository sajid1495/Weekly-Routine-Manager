import 'package:flutter/material.dart';
import 'package:wrtnm/page/day_task_page.dart';

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DayTaskPage(day: days[index]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
