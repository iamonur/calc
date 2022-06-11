import './operations.dart';

abstract class SingleOperandOperation extends Operation {
  final Operation myVal;

  SingleOperandOperation(this.myVal);
}
