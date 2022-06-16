import './token_utilities.dart';
import './stack.dart';
import 'dart:math';
import 'dart:collection';

enum expressionType { postfix, infix, notInitialized }

//TODO: Custom exception.

class Parser {
  String _myExpression;
  expressionType _myType = expressionType.notInitialized;
  Queue<String> myTokensRPN = Queue<String>();

  Parser(this._myExpression) {
    _myType = _calculateType();

    if (_myType == expressionType.infix) {
      _substitute();
      _checkParantheses();
      _infixToPostfix(_addMultiplications());
      _myType = expressionType.postfix;
    } else if (_myType == expressionType.postfix) {
      _substitute();
      _parseTokens();
    }
  }

  expressionType _calculateType() {
    if (_myExpression.contains('(')) {
      return expressionType.infix;
    } else if (isOperator(_myExpression.substring(_myExpression.length - 1))) {
      return expressionType.postfix;
    }
    return expressionType.infix;
  }

  void _substitute() {
    RegExp eulers = RegExp('e|E');
    RegExp piExp = RegExp('pi|PI');

    _myExpression = _myExpression.replaceAllMapped(
        eulers, (match) => "(" + exp(1).toString() + ")");
    _myExpression = _myExpression.replaceAllMapped(
        piExp, (match) => "(" + pi.toString() + ")");
  }

  void _checkParantheses() {
    Stack<bool> parans = Stack<bool>();

    _myExpression.split('').forEach((ch) {
      if (ch == '(') {
        parans.push(true);
      } else if (ch == ')') {
        if (parans.canPop()) {
          parans.pop();
        }
        //TODO: Else throw.
      }
    });

    if (!parans.canPop()) {
      return;
    }
    //TODO: Else throw.
  }

  Queue<String> _addMultiplications() {
    Queue<String> tokens = Queue<String>();
    RegExp rgx = RegExp(
        r"[0-9]?([0-9]*[.])?[0-9]+|sin|cos|tan|ctan|log|ln|x|[\\+\\(\\)\\/\\*\\-\\=]");
    Iterable<Match> matches = rgx.allMatches(_myExpression);

    matches.forEach((m) {
      tokens.add(m.group(0) as String);
    });

    int sz = tokens.length;

    for (int i = 0; i < sz; i++) {
      if (tokens.first == "log") {
        tokens.removeFirst();
        i++;

        if (i == tokens.length) {
          i--;
          tokens.add("log");
          continue;
        }

        String first = tokens.first;
        tokens.removeFirst();
        i++;

        if (i == tokens.length) {
          i--;
          tokens.add("log");
          tokens.add(first);
          continue;
        }

        String second = tokens.first;
        tokens.removeFirst();

        if (isDigit(first) && second == "(") {
          tokens.add(first);
          tokens.add("log?");
          tokens.add(second);
        } else {
          tokens.add("log");
          tokens.add(first);
          tokens.add(second);
        }
      }
    }

    sz = tokens.length;
    for (int i = 0; i < sz - 1; i++) {
      String tkn = tokens.first;
      tokens.removeFirst();

      if (isDigit(tkn) && (isDigit(tokens.first) || (tokens.first == "("))) {
        tokens.add(tkn);
        tokens.add('*');
      } else if ((tkn == ")") && isDigit(tokens.first)) {
        tokens.add(tkn);
        tokens.add('*');
      } else {
        tokens.add(tkn);
      }
    }

    tokens.add(tokens.first);
    tokens.removeFirst();

    return tokens;
  }

  void _infixToPostfix(Queue<String> tokens) {
    Stack<String> st = Stack<String>();

    while (tokens.isNotEmpty) {
      if (isDigit(tokens.first)) {
        myTokensRPN.add(tokens.first);
      } else if (tokens.first == '(') {
        st.push(tokens.first);
      } else if (tokens.first == ')') {
        bool balanced = false;
        while (!st.canPop()) {
          if (st.peak() == '(') {
            st.pop();
            balanced = true;
            break;
          } else {
            myTokensRPN.add(st.pop());
          }
        }
        //TODO if(!balanced) throw
      } else if (isOperator(tokens.first) || isFunction(tokens.first)) {
        while (st.canPop() && compare(tokens.first, st.peak()) == -1) {
          if (st.peak() != '(') {
            myTokensRPN.add(st.pop());
          } else {
            break;
          }
        }
        st.push(tokens.first);
      }
      tokens.removeFirst();
    }
    while (st.canPop()) {
      myTokensRPN.add(st.pop());
    }
  }

  void _parseTokens() {
    RegExp rgx = RegExp(
        r"[0-9]?([0-9]*[.])?[0-9]+|sin|cos|tan|ctan|log|ln|[\\+\\(\\)\\/\\*\\-]");
    Iterable<Match> matches = rgx.allMatches(_myExpression);

    matches.forEach((m) {
      myTokensRPN.add(m.toString());
    });
  }

  @override
  String toString() {
    String ret = "";
    myTokensRPN.forEach((element) {
      ret += element;
      ret += " ";
    });
    return ret;
  }

  Queue<String> getParsedQ() {
    return myTokensRPN;
  }
}
