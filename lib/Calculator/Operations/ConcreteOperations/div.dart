import '../Interfaces/operations.dart';
import '../Interfaces/double_operand_operation.dart';
import '../Interfaces/number.dart';

class Add extends DoubleOperandOperation {
  Add(Operation op1, Operation op2) : super(op1, op2);

  @override
  Operation operate() {
    double v1 = (super.myVal1.operate() as Number).getVal();
    double v2 = (super.myVal2.operate() as Number).getVal();

    //TODO: exception on divbyzero.
    return Number(v1 / v2);
  }
}
