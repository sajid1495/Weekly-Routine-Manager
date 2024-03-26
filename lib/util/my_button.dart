import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  myButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
