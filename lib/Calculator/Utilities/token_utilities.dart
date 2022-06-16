import './consts.dart';

enum prec { none, subAdd, multDiv, funcP }

Map<String, prec> precedences = {
  sub_: prec.subAdd,
  add_: prec.subAdd,
  multiply_: prec.multDiv,
  divide_: prec.multDiv,
  pLeft_: prec.funcP,
  pRight_: prec.funcP
};

bool isFunction(String op) {
  return functionList.contains(op);
}

bool isUnary(String op) {
  return unaryOperators.contains(op);
}

bool isBinary(String op) {
  return binaryOperators.contains(op);
}

bool isDigit(String token) {
  return double.tryParse(token) != null;
}

bool isOperator(String op) {
  return (isFunction(op) || isUnary(op) || isBinary(op));
}

prec precedence(String op) {
  if (isFunction(op)) {
    return prec.funcP;
  } else if (precedences.containsKey(op)) {
    return precedences[op] as prec;
  } else {
    return prec.none;
  }
}

int compare(String op1, String op2) {
  if (precedence(op1) == precedence(op2)) {
    return -1;
  }
  return (precedence(op1) as int) > (precedence(op2) as int) ? 1 : -1;
}
