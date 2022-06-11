import './operations.dart';

class Number extends Operation {
  final double __myVal;

  Number(this.__myVal);

  double getVal() {
    return __myVal;
  }

  @override
  Operation operate() {
    return this;
  }
}
