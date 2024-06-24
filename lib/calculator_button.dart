import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String text;
  void Function(String) onClicked;

  @override
  CalculatorButton({required this.text, required this.onClicked});

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        child: ElevatedButton(
          onPressed: () {
            onClicked(text);
          },
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, shape: RoundedRectangleBorder()),
        ),
      ),
    );
  }
}
