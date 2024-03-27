import 'package:flutter/material.dart';
import 'package:wrtnm/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            GestureDetector(
              onTap: () {
                _selectTime(context);
              },
              child: AbsorbPointer(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Tap to Select Time",
                  ),
                ),
              ),
            ),

            //buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //cancel button
                myButton(text: "Cancel", onPressed: onCancel),

                //save button
                myButton(text: "Save", onPressed: onSave),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      _addDetails(context, picked);
    }
  }

  Future<void> _addDetails(BuildContext context, TimeOfDay time) async {
    TextEditingController detailsController = TextEditingController();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        Size.fromHeight(120);
        return AlertDialog(
          backgroundColor: Colors.blue[200],
          title: Text('Add Details'),
          content: TextField(
            controller: detailsController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Details',
              hintText: 'Enter Details...',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String details = detailsController.text.trim();
                if (details.isNotEmpty) {
                  controller.text = '${time.format(context)} - $details';
                }
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
