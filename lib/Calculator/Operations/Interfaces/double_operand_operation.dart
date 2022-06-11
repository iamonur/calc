import './operations.dart';

abstract class DoubleOperandOperation extends Operation {
  final Operation myVal1;
  final Operation myVal2;

  DoubleOperandOperation(this.myVal1, this.myVal2);
}
