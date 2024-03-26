import 'package:flutter/material.dart';
import 'package:wrtnm/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

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
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Schedule"),
            ),

            //buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //cancel button
                myButton(text: "Cancel", onPressed: onCancel),

                //save button
                myButton(text: "Save", onPressed: onSave)
              ],
            )
          ],
        ),
      ),
    );
  }
}
