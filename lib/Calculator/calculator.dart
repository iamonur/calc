import './Utilities/expression_tree_builder.dart';

import './Operations/Interfaces/operations.dart';
import './Operations/Interfaces/number.dart';
import './Utilities/parser.dart';

String calculate(String input) {
  Parser p = Parser(input);

  Operation a = buildTreeFromRPN(p.getParsedQ());
  Number c = a.operate() as Number;
  double res = c.getVal();
  if (res > 999999999 ||
      res < -999999999 ||
      (res < 0.000000001 && res > -0.000000001)) {
    return res.toStringAsExponential();
  }
  if (res.toString().length > 10) {
    return res.toStringAsPrecision(10);
  }
  return res.toString();
}
