import 'package:flutter/material.dart';
import 'Calculator/calculator.dart';

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
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          pressButton(btntxt);
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
      ),
    );
  }

  dynamic calcText = '';
  dynamic lastCalc = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  lastCalc,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 32),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  calcText,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('CE', Colors.grey, Colors.black),
                calcbutton('( ', Colors.grey, Colors.black),
                calcbutton(' )', Colors.grey, Colors.black),
                calcbutton('/', Colors.amberAccent.shade700, Colors.white),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('7', Colors.grey.shade800, Colors.white),
                calcbutton('8', Colors.grey.shade800, Colors.white),
                calcbutton('9', Colors.grey.shade800, Colors.white),
                calcbutton('*', Colors.amberAccent.shade700, Colors.white),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('4', Colors.grey.shade800, Colors.white),
                calcbutton('5', Colors.grey.shade800, Colors.white),
                calcbutton('6', Colors.grey.shade800, Colors.white),
                calcbutton(' - ', Colors.amberAccent.shade700, Colors.white),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('1', Colors.grey.shade800, Colors.white),
                calcbutton('2', Colors.grey.shade800, Colors.white),
                calcbutton('3', Colors.grey.shade800, Colors.white),
                calcbutton(' + ', Colors.amberAccent.shade700, Colors.white),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    padding: EdgeInsets.fromLTRB(34, 20, 120, 20),
                    onPressed: () {
                      pressButton('0');
                    },
                    shape: StadiumBorder(),
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                    color: Colors.grey.shade800),
                calcbutton(',', Colors.grey.shade800, Colors.white),
                calcbutton('=', Colors.amberAccent.shade700, Colors.white),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  void pressButton(String button) {
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
        calcText += (' = ' + temp);
        calcToLastCalc = true;
        break;
      default:
        calcText += button;
    }

    setState(() {
      if (calcToLastCalc) {
        lastCalc = calcText;
        calcText = '';
      } else {
        calcText;
      }
    });
  }
}
