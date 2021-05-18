abstract class CalculatorEvent {
  const CalculatorEvent();
}

class BackspacePressed extends CalculatorEvent {}

class CalculateResult extends CalculatorEvent {}

class ClearCalculation extends CalculatorEvent {}

class NumberPressed extends CalculatorEvent {
  final String number;

  const NumberPressed({required this.number});
}

class OperatorPressed extends CalculatorEvent {
  final String operator;

  const OperatorPressed({required this.operator});
}
