import 'package:calculator/calculator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}


class Calculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        CalculatorScreen.routeName: (context)=> CalculatorScreen(),
      },
      initialRoute: CalculatorScreen.routeName,
    );
  }
}