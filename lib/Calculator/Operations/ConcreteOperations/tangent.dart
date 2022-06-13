import '../Interfaces/operations.dart';
import '../Interfaces/single_operand_operation.dart';
import '../Interfaces/number.dart';
import 'dart:math';

class Tangent extends SingleOperandOperation {
  Tangent(Operation op) : super(op);

  @override
  Operation operate() {
    double val = (super.myVal.operate() as Number).getVal();
    double ret;
    if (cos(val) == 0) {
      ret = double.infinity;
    } else {
      ret = sin(val) / cos(val);
    }
    return Number(ret);
  }
}
