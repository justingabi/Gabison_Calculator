// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_interpolation_to_compose_strings, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget numButton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () {
        calculation(btnText);
      },
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 25,
          color: txtColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70, 70),
        shape: CircleBorder(),
        backgroundColor: btnColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 80),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("C", Colors.grey, Colors.black),
                numButton("+/-", Colors.grey, Colors.black),
                numButton("%", Colors.grey, Colors.black),
                numButton("/", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("7", (Colors.grey[850])!, Colors.white),
                numButton("8", (Colors.grey[850])!, Colors.white),
                numButton("9", (Colors.grey[850])!, Colors.white),
                numButton("x", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("4", (Colors.grey[850])!, Colors.white),
                numButton("5", (Colors.grey[850])!, Colors.white),
                numButton("6", (Colors.grey[850])!, Colors.white),
                numButton("-", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton("1", (Colors.grey[850])!, Colors.white),
                numButton("2", (Colors.grey[850])!, Colors.white),
                numButton("3", (Colors.grey[850])!, Colors.white),
                numButton("+", Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Colors.grey.shade800,
                    padding: EdgeInsets.fromLTRB(34, 15, 120, 15),
                  ),
                  onPressed: () {
                    calculation("0");
                  },
                  child: Text(
                    "0",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
                numButton('.', Colors.grey.shade800, Colors.white),
                numButton('=', Colors.grey.shade700, Colors.white),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'C') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = (numOne / 100).toString();
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}
  // Logic
//   int firstNumber = 0;
//   int secondNumber = 0;
//   dynamic result = "";
//   String text = "";
//   String operation = "";
//   dynamic res = '';

//   void calculate(String btnText) {
//     String doesContainDecimal(dynamic result) {
//       if (result.toString().contains('.')) {
//         List<String> splitDecimal = result.toString().split('.');
//         if (!(int.parse(splitDecimal[1]) > 0))
//           return res = splitDecimal[0].toString();
//       }
//       return result;
//     }

//     String add() {
//       result = (firstNumber + secondNumber).toString();
//       firstNumber = double.parse(result) as int;
//       return doesContainDecimal(result);
//     }

//     String sub() {
//       result = (firstNumber - secondNumber).toString();
//       firstNumber = double.parse(result) as int;
//       return doesContainDecimal(result);
//     }

//     String mul() {
//       result = (firstNumber * secondNumber).toString();
//       firstNumber = double.parse(result) as int;
//       return doesContainDecimal(result);
//     }

//     String div() {
//       result = (firstNumber / secondNumber).toString();
//       firstNumber = double.parse(result);
//       return doesContainDecimal(result);
//     }

//     if (btnText == "C") {
//       result = "";
//       text = "";
//       firstNumber = 0;
//       secondNumber = 0;
//     } else if (btnText == "+" ||
//         btnText == "-" ||
//         btnText == "x" ||
//         btnText == "/") {
//       firstNumber = double.parse(text);
//       result = "";
//       operation = btnText;
//     } else if (btnText == '%') {
//       res = (firstNumber / 100).toString();
//       result = doesContainDecimal(res);
//     } else if (btnText == '.') {
//       if (!result.toString().contains('.')) {
//         result = result.toString() + '.';
//       }
//       result = result;
//     } else if (btnText == '+/-') {
//       res.toString().startsWith('-')
//           ? res = res.toString().substring(1)
//           : res = '-' + res.toString();
//       result = res;
//     } else if (btnText == "=") {
//       secondNumber = int.parse(text);
//       if (operation == "+") {
//         // result = (firstNumber + secondNumber).toString();
//         result = add();
//       }
//       if (operation == "-") {
//         // result = (firstNumber - secondNumber).toString();
//         result = sub();
//       }
//       if (operation == "x") {
//         // result = (firstNumber * secondNumber).toString();
//         result = mul();
//       }
//       if (operation == "/") {
//         // result = (firstNumber ~/ secondNumber).toString();
//         result = div();
//       }
//     } else {
//       result = int.parse(text + btnText).toString();
//     }
//     setState(() {
//       text = result;
//     });
//   }

