import 'package:calculator/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = 'calculator';

  @override
  State<StatefulWidget> createState() {
    return CalculatorScreenState();
  }
}

class CalculatorScreenState extends State {
  String resultText = '';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 10),
            child: Text(
              resultText,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(text: "7", onClicked: onDigitClicked),
                CalculatorButton(text: "8", onClicked: onDigitClicked),
                CalculatorButton(text: "9", onClicked: onDigitClicked),
                CalculatorButton(text: "*", onClicked: onOperatorClicked),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  text: "4",
                  onClicked: onDigitClicked,
                ),
                CalculatorButton(
                  text: "5",
                  onClicked: onDigitClicked,
                ),
                CalculatorButton(
                  text: "6",
                  onClicked: onDigitClicked,
                ),
                CalculatorButton(
                  text: "/",
                  onClicked: onOperatorClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  text: "1",
                  onClicked: onDigitClicked,
                ),
                CalculatorButton(
                  text: "2",
                  onClicked: onDigitClicked,
                ),
                CalculatorButton(
                  text: "3",
                  onClicked: onDigitClicked,
                ),
                CalculatorButton(
                  text: "+",
                  onClicked: onOperatorClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  text: ".",
                  onClicked: onDotClicked,
                ),
                CalculatorButton(
                  text: "0",
                  onClicked: onDigitClicked,
                ),
                CalculatorButton(
                  text: "=",
                  onClicked: onClickedEqual,
                ),
                CalculatorButton(
                  text: "-",
                  onClicked: onOperatorClicked,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDigitClicked(String digit) {
    setState(() {
      resultText += digit;
    });
  }

  String savedNumber = '';
  String savedOperator = '';

  void onOperatorClicked(String operator) {
    if (resultText.isEmpty) {
      return;
    }
    if (savedOperator.isNotEmpty) {
      savedOperator = operator;
    }

    if (savedNumber.isEmpty) {
      savedNumber = resultText;
      savedOperator = operator;
      resultText = '';
      setState(() {});
    } else if (resultText.isEmpty) {
      calculate(savedNumber, savedOperator, resultText);
      savedNumber = '';
      savedOperator = '';
    }
  }

  void calculate(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);

    if (operator == '+') {
      resultText = (num1 + num2).toString();
    } else if (operator == '-') {
      resultText = (num1 - num2).toString();
    } else if (operator == '*') {
      resultText = (num1 * num2).toString();
    } else if (operator == '/') {
      resultText = (num1 / num2).toString();
    }

    setState(() {});
  }

  void onClickedEqual(String text) {
    if (savedNumber.isEmpty) {
      return;
    } else {
      calculate(savedNumber, savedOperator, resultText);
      savedNumber = '';
      savedOperator = '';
      setState(() {});
    }
  }

  void onDotClicked(String text) {
    if (resultText.contains(".")) {
      return;
    }
    resultText += ".";
    setState(() {});
  }
}
