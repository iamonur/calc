import 'package:flutter/material.dart';
import 'Calculator/calculator.dart';

enum calcModes { basic, hex, scientific, conversion }
enum hexModes { hex, binary }

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget basicButton(String btntxt, Color btncolor, Color txtcolor) {
    return RaisedButton(
      onPressed: () {
        basicPressButton(btntxt);
      },
      child: Text(
        btntxt,
        style: TextStyle(
          color: txtcolor,
          fontSize: 32,
          backgroundColor: btncolor,
        ),
      ),
      color: btncolor,
      shape: CircleBorder(),
      padding: EdgeInsets.all(20),
    );
  }

  Widget hexButton(String btntxt, Color btncolor, Color txtcolor) {
    return RaisedButton(
      onPressed: () {
        hexPressButton(btntxt);
      },
      child: Text(
        btntxt,
        style: TextStyle(
          color: txtcolor,
          fontSize: 32,
          backgroundColor: btncolor,
        ),
      ),
      color: btncolor,
      shape: CircleBorder(),
      padding: EdgeInsets.all(18),
    );
  }

  Widget basicScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  calcText = '';
                  lastCalc = '';
                  myMode = calcModes.basic;
                  myHexMode = hexModes.hex;
                });
              },
              child: const Text(
                'Basic',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  calcText = '';
                  lastCalc = '';
                  myMode = calcModes.hex;
                  myHexMode = hexModes.hex;
                });
              },
              child: const Text(
                'Hex',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
            ),
            RaisedButton(
              onPressed: () {},
              child: const Text(
                'Scientific',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              color: Colors.black,
            ),
            RaisedButton(
              onPressed: () {},
              child: const Text(
                'Convert',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              lastCalc,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey.shade400, fontSize: 20),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              calcText,
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.white, fontSize: 50),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            basicButton('CE', Colors.grey, Colors.black),
            basicButton('( ', Colors.grey, Colors.black),
            basicButton(' )', Colors.grey, Colors.black),
            basicButton('/', Colors.amberAccent.shade700, Colors.white),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            basicButton('7', Colors.grey.shade800, Colors.white),
            basicButton('8', Colors.grey.shade800, Colors.white),
            basicButton('9', Colors.grey.shade800, Colors.white),
            basicButton('*', Colors.amberAccent.shade700, Colors.white),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            basicButton('4', Colors.grey.shade800, Colors.white),
            basicButton('5', Colors.grey.shade800, Colors.white),
            basicButton('6', Colors.grey.shade800, Colors.white),
            basicButton(' - ', Colors.amberAccent.shade700, Colors.white),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            basicButton('1', Colors.grey.shade800, Colors.white),
            basicButton('2', Colors.grey.shade800, Colors.white),
            basicButton('3', Colors.grey.shade800, Colors.white),
            basicButton(' + ', Colors.amberAccent.shade700, Colors.white),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
                padding: const EdgeInsets.fromLTRB(34, 20, 120, 20),
                onPressed: () {
                  basicPressButton('0');
                },
                shape: const StadiumBorder(),
                child: const Text(
                  '0',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                color: Colors.grey.shade800),
            basicButton('.', Colors.grey.shade800, Colors.white),
            basicButton('=', Colors.amberAccent.shade700, Colors.white),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget hexScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  calcText = '';
                  lastCalc = '';
                  myMode = calcModes.basic;
                  myHexMode = hexModes.hex;
                });
              },
              child: const Text(
                'Basic',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  calcText = '';
                  lastCalc = '';
                  myMode = calcModes.hex;
                  myHexMode = hexModes.hex;
                });
              },
              child: const Text(
                'Hex',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
            ),
            RaisedButton(
              onPressed: () {},
              child: const Text(
                'Scientific',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              color: Colors.black,
            ),
            RaisedButton(
              onPressed: () {},
              child: const Text(
                'Convert',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              calcText,
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.white, fontSize: 50),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hexButton('bin', Colors.grey.shade400, Colors.black),
            hexButton('hex', Colors.grey.shade400, Colors.black),
            hexButton('CE', Colors.grey.shade400, Colors.black),
            hexButton('=', Colors.amberAccent.shade700, Colors.white),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hexButton('+', Colors.amberAccent.shade700, Colors.white),
            hexButton('-', Colors.amberAccent.shade700, Colors.white),
            hexButton('*', Colors.amberAccent.shade700, Colors.white),
            hexButton('/', Colors.amberAccent.shade700, Colors.white),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hexButton('C', Colors.grey.shade800, Colors.white),
            hexButton('D', Colors.grey.shade800, Colors.white),
            hexButton('E', Colors.grey.shade800, Colors.white),
            hexButton('F', Colors.grey.shade800, Colors.white),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hexButton('8', Colors.grey.shade800, Colors.white),
            hexButton('9', Colors.grey.shade800, Colors.white),
            hexButton('A', Colors.grey.shade800, Colors.white),
            hexButton('B', Colors.grey.shade800, Colors.white),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hexButton('4', Colors.grey.shade800, Colors.white),
            hexButton('5', Colors.grey.shade800, Colors.white),
            hexButton('6', Colors.grey.shade800, Colors.white),
            hexButton('7', Colors.grey.shade800, Colors.white),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hexButton('0', Colors.grey.shade800, Colors.white),
            hexButton('1', Colors.grey.shade800, Colors.white),
            hexButton('2', Colors.grey.shade800, Colors.white),
            hexButton('3', Colors.grey.shade800, Colors.white),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
      ],
    );
  }

  dynamic calcText = '';
  dynamic lastCalc = '';

  calcModes myMode = calcModes.hex;
  hexModes myHexMode = hexModes.hex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: myMode == calcModes.basic ? basicScreen() : hexScreen(),
      ),
    );
  }

  void basicPressButton(String button) {
    bool calcToLastCalc = false;
    switch (button) {
      case 'CE':
        if (calcText != '') {
          calcText = '';
        } else {
          calcText = '';
          lastCalc = '';
        }
        break;
      case '=':
        String temp = calculate(calcText);
        if (temp.endsWith('.0')) {
          temp = temp.substring(0, temp.length - 2);
        }
        lastCalc = calcText + (' = ' + temp);
        calcText = '';
        calcToLastCalc = true;
        break;
      default:
        calcText += button;
    }

    setState(() {
      if (calcToLastCalc) {
        lastCalc;
        calcText;
      } else {
        calcText;
      }
    });
  }

  void hexPressButton(String button) {}
}
