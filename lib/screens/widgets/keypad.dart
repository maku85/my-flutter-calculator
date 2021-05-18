import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_calculator/bloc/calculator_bloc.dart';
import 'package:flutter_calculator/bloc/calculator_state.dart';
import 'package:flutter_calculator/screens/widgets/key.dart';
import 'package:flutter_calculator/models/key_symbol.dart';

class Keypad extends StatelessWidget {
  final Function onButtonPressed;

  Keypad(this.onButtonPressed);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
      return Container(
        padding: EdgeInsets.all(16),
        child: Column(children: <Widget>[
          _getRowButtons([
            state.primaryText == '0' && state.history != ''
                ? Keys.clearAll
                : Keys.clear,
            Keys.backspace,
            Keys.percent,
            Keys.divide
          ]),
          _getRowButtons([Keys.seven, Keys.eight, Keys.nine, Keys.multiply]),
          _getRowButtons([Keys.four, Keys.five, Keys.six, Keys.subtract]),
          _getRowButtons([Keys.one, Keys.two, Keys.three, Keys.add]),
          _getRowButtons([Keys.decimal, Keys.zero, Keys.decimal, Keys.equals]),
        ]),
      );
    });
  }

  Widget _getRowButtons(List<KeySymbol> symbols) {
    return Expanded(
      child: Row(children: <Widget>[
        for (var symbol in symbols)
          CalculatorKey(
            symbol: symbol,
            onPressed: () => onButtonPressed(symbol.value),
          )
      ]),
    );
  }
}
