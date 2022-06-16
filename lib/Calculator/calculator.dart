import './Utilities/expression_tree_builder.dart';

import './Operations/Interfaces/operations.dart';
import './Operations/Interfaces/number.dart';

import './Utilities/parser.dart';

String calculate(String input) {
  Parser p = Parser(input);

  Operation a = buildTreeFromRPN(p.getParsedQ());
  Number c = a.operate() as Number;
  double res = c.getVal();

  return res.toString();
}
