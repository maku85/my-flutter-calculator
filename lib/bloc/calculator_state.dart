abstract class CalculatorState {
  String primaryText = '';
  String secondaryText = '';
  String history = '';

  CalculatorState(this.primaryText, this.secondaryText, this.history);
}

class CalculationInitial extends CalculatorState {
  CalculationInitial() : super('0', '', '');
}

class CalculationSuccess extends CalculatorState {
  CalculationSuccess({primaryText = '', secondaryText = '', history = ''})
      : super(primaryText, secondaryText, history);
}
