import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

import 'package:flutter_calculator/screens/widgets/key.dart';
import 'calculator_state.dart';
import 'calculator_event.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculationInitial());

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if (event is BackspacePressed) {
      yield* _mapBackspacePressedToState();
    }

    if (event is CalculateResult) {
      yield* _mapCalculateResultToState();
    }

    if (event is ClearCalculation) {
      yield* _mapClearCalculationToState();
    }

    if (event is NumberPressed) {
      yield* _mapNumberPressedToState(event);
    }

    if (event is OperatorPressed) {
      yield* _mapOperatorPressedToState(event);
    }
  }

  Stream<CalculatorState> _mapBackspacePressedToState() async* {
    if (state.primaryText.length == 1) {
      yield CalculationSuccess(
          primaryText: '0', secondaryText: '', history: state.history);
    } else {
      String primaryText = state.primaryText.replaceAll(RegExp(r'.$'), '');
      String secondaryText = state.secondaryText;
      double result = _calculate(primaryText);
      if (result != double.infinity) {
        secondaryText = '=' + _cleanResult(result);
      }
      yield CalculationSuccess(
          primaryText: primaryText,
          secondaryText: secondaryText,
          history: state.history);
    }
  }

  Stream<CalculatorState> _mapCalculateResultToState() async* {
    if (state.primaryText == '0' ||
        double.tryParse(state.primaryText) != null) {
      return;
    }
    String lastDigit =
        state.primaryText.substring(state.primaryText.length - 1);
    if (Keys.operators.contains(lastDigit)) return;

    double result = _calculate(state.primaryText);
    String history = state.history + '\n' + state.primaryText;
    yield CalculationSuccess(
        primaryText: _cleanResult(result), secondaryText: '', history: history);
  }

  Stream<CalculatorState> _mapClearCalculationToState() async* {
    String history = state.history;
    if (state.primaryText == '0') history = '';
    yield CalculationSuccess(
        primaryText: '0', secondaryText: '', history: history);
  }

  Stream<CalculatorState> _mapNumberPressedToState(
    NumberPressed event,
  ) async* {
    String primaryText = state.primaryText == '0'
        ? event.number
        : state.primaryText + event.number;
    String secondaryText = state.secondaryText;
    String lastDigit =
        state.primaryText.substring(state.primaryText.length - 1);
    if (lastDigit != Keys.decimal.value) {
      double result = _calculate(primaryText);
      secondaryText = '=' + _cleanResult(result);
    }
    yield CalculationSuccess(
        primaryText: primaryText,
        secondaryText: secondaryText,
        history: state.history);
  }

  Stream<CalculatorState> _mapOperatorPressedToState(
    OperatorPressed event,
  ) async* {
    String lastDigit =
        state.primaryText.substring(state.primaryText.length - 1);
    if (Keys.operators.contains(lastDigit)) return;

    String primaryText = state.primaryText == '0'
        ? event.operator
        : state.primaryText + event.operator;
    String secondaryText = state.secondaryText;
    yield CalculationSuccess(
        primaryText: primaryText,
        secondaryText: secondaryText,
        history: state.history);
  }

  double _calculate(String expression) {
    expression = expression.replaceAll('x', '*');
    expression = expression.replaceAll('÷', '/');
    Parser p = Parser();
    Expression exp = p.parse(expression);
    return exp.evaluate(EvaluationType.REAL, ContextModel());
  }

  String sepByComma(String org) {
    String formatted = '';

    for (var i = 0; i < org.length; i++) {
      formatted += org[i];
      if ((org.length - (i + 1)) % 3 == 0 && (i + 1) != org.length)
        formatted += ',';
    }

    return formatted;
  }

  String _cleanResult(double result) {
    String cleaned;

    if (result == result.round()) {
      cleaned = result.round().toString();
    } else {
      cleaned = result.toStringAsFixed(4).replaceAll(RegExp(r'0+$'), '');
      List<String> splitted = cleaned.split('.');
      cleaned = sepByComma(splitted[0]) + '.' + splitted[1];
    }

    return cleaned;
  }
}
