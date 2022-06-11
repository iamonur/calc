import '../Interfaces/operations.dart';
import '../Interfaces/single_operand_operation.dart';
import '../Interfaces/number.dart';
import 'dart:math';

class Sine extends SingleOperandOperation {
  Sine(Operation op) : super(op);

  @override
  Operation operate() {
    double ret = sin((super.myVal.operate() as Number).getVal());

    return Number(ret);
  }
}
