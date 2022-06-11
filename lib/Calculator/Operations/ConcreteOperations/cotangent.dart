import '../Interfaces/operations.dart';
import '../Interfaces/single_operand_operation.dart';
import '../Interfaces/number.dart';
import 'dart:math';

class Cotangent extends SingleOperandOperation {
  Cotangent(Operation op) : super(op);

  @override
  Operation operate() {
    double val = (super.myVal.operate() as Number).getVal();
    double ret;
    if (sin(val) == 0) {
      ret = double.infinity;
    } else {
      ret = cos(val) / sin(val);
    }
    return Number(ret);
  }
}
