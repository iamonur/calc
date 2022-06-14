import 'dart:collection';

import 'package:calc/Calculator/Utilities/token_utilities.dart';

import '../Operations/Interfaces/operations.dart';
import './consts.dart';
import './stack.dart';
import '../Operations/Interfaces/number.dart';

import '../Operations/ConcreteOperations/div.dart';
import '../Operations/ConcreteOperations/mult.dart';
import '../Operations/ConcreteOperations/add.dart';
import '../Operations/ConcreteOperations/sub.dart';
import '../Operations/ConcreteOperations/sine.dart';
import '../Operations/ConcreteOperations/cosine.dart';
import '../Operations/ConcreteOperations/tangent.dart';
import '../Operations/ConcreteOperations/cotangent.dart';
import '../Operations/ConcreteOperations/logarithm.dart';

import 'dart:math';

enum operators {
  divide,
  multiply,
  add,
  subtract,
  sine,
  cosine,
  tangent,
  ctangent,
  log,
  logBin,
  ln
}

Map<String, operators> ops = {
  divide_: operators.divide,
  multiply_: operators.multiply,
  add_: operators.add,
  sub_: operators.subtract,
  sine_: operators.sine,
  cosine_: operators.cosine,
  tangent_: operators.tangent,
  ctangent_: operators.ctangent,
  log_: operators.log,
  log__: operators.logBin,
  ln_: operators.ln
};

Operation getOp(String opname, Operation operand1,
    {Operation? operand2 = null}) {
  operand2 = operand2 ?? Number(0);

  switch (ops[opname]) {
    case operators.divide:
      return Div(operand1, operand2);
    case operators.multiply:
      return Mult(operand1, operand2);
    case operators.add:
      return Add(operand1, operand2);
    case operators.subtract:
      return Sub(operand1, operand2);
    case operators.sine:
      return Sine(operand1);
    case operators.cosine:
      return Cosine(operand1);
    case operators.tangent:
      return Tangent(operand1);
    case operators.ctangent:
      return Cotangent(operand1);
    case operators.log:
      return Logarithm(operand1);
    case operators.ln:
      return Logarithm(operand1, myBase: exp(1));
    case operators.logBin:
      return Logarithm(operand1,
          myBase: (operand2.operate() as Number).getVal());
    default:
  }
  return null as Operation;
}

Operation buildTreeFromRPN(Queue<String> tokens) {
  Stack<Operation> st = Stack<Operation>();
  Queue<String> output;

  tokens.forEach((element) {
    if (isDigit(element)) {
      st.push(Number(double.parse(element)));
    } else if (isUnary(element)) {
      Operation op = st.pop();
      st.push(getOp(element, op));
    } else if (isBinary(element)) {
      Operation a = st.pop();
      Operation? op2;

      if (st.canPop()) {
        op2 = st.pop();
      } else {
        op2 = null;
      }

      st.push(getOp(element, a, operand2: op2));
    }
  });

  tokens.clear();

  return st.pop();
}
