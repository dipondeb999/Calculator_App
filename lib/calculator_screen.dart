import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Variables to store the current number, the result, and the operator
  String _output = "0";
  String _result = "0";
  String _operand = "";
  double num1 = 0;
  double num2 = 0;

  // Method to handle button presses
  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "Ac") {
        _output = "0";
        _result = "0";
        num1 = 0;
        num2 = 0;
        _operand = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "x" ||
          buttonText == "/") {
        num1 = double.parse(_result);
        _operand = buttonText;
        _output = "0";
      } else if (buttonText == ".") {
        if (!_output.contains(".")) {
          _output = _output + buttonText;
        }
      } else if (buttonText == "=") {
        num2 = double.parse(_output);

        if (_operand == "+") {
          _result = (num1 + num2).toString();
        }
        if (_operand == "-") {
          _result = (num1 - num2).toString();
        }
        if (_operand == "x") {
          _result = (num1 * num2).toString();
        }
        if (_operand == "/") {
          _result = (num1 / num2).toString();
        }

        _output = _result;
        _operand = "";
      } else if (buttonText == "+/-") {
        if (_output.startsWith("-")) {
          _output = _output.substring(1);
        } else {
          _output = "-" + _output;
        }
      } else if (buttonText == "%") {
        _output = (double.parse(_output) / 100).toString();
      } else {
        _output = _output + buttonText;
      }

      _result = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget calculatorButton(String buttonText, Color buttonColor, Color textColor) {
    return Container(
      child: MaterialButton(
        padding: const EdgeInsets.all(15),
        onPressed: () => buttonPressed(buttonText),
        shape: const CircleBorder(),
        color: buttonColor,
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor,
            fontSize: 35,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Calculator'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Calculator display
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    _output,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 100,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton('Ac', Colors.grey, Colors.black),
                calculatorButton('+/-', Colors.grey, Colors.black),
                calculatorButton('%', Colors.grey, Colors.black),
                calculatorButton('/', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton('7', Colors.grey.shade800, Colors.white),
                calculatorButton('8', Colors.grey.shade800, Colors.white),
                calculatorButton('9', Colors.grey.shade800, Colors.white),
                calculatorButton('x', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton('4', Colors.grey.shade800, Colors.white),
                calculatorButton('5', Colors.grey.shade800, Colors.white),
                calculatorButton('6', Colors.grey.shade800, Colors.white),
                calculatorButton('-', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton('1', Colors.grey.shade800, Colors.white),
                calculatorButton('2', Colors.grey.shade800, Colors.white),
                calculatorButton('3', Colors.grey.shade800, Colors.white),
                calculatorButton('+', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
                  onPressed: () => buttonPressed('0'),
                  shape: const StadiumBorder(),
                  color: Colors.grey.shade800,
                  child: const Text(
                    '0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ),
                calculatorButton('.', Colors.grey.shade800, Colors.white),
                calculatorButton('=', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
