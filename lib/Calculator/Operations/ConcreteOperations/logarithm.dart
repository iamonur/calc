import '../Interfaces/operations.dart';
import '../Interfaces/single_operand_operation.dart';
import '../Interfaces/number.dart';
import 'dart:math';

class Logarithm extends SingleOperandOperation {
  final double myBase;
  Logarithm(Operation op, {this.myBase = 10}) : super(op);

  @override
  Operation operate() {
    double v1 = (super.myVal.operate() as Number).getVal();

    //TODO: Exception on divbyzero.
    double ret = log(v1) / log(myBase);

    return Number(ret);
  }
}
