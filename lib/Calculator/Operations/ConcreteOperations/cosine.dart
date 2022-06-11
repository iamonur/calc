import '../Interfaces/operations.dart';
import '../Interfaces/single_operand_operation.dart';
import '../Interfaces/number.dart';
import 'dart:math';

class Cosine extends SingleOperandOperation {
  Cosine(Operation op) : super(op);

  @override
  Operation operate() {
    double ret = cos((super.myVal.operate() as Number).getVal());

    return Number(ret);
  }
}
