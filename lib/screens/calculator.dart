import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_calculator/bloc/calculator_bloc.dart';
import 'package:flutter_calculator/bloc/calculator_event.dart';
import 'package:flutter_calculator/screens/widgets/display.dart';
import 'package:flutter_calculator/screens/widgets/key.dart';
import 'package:flutter_calculator/screens/widgets/keypad.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final CalculatorBloc _calculatorBloc = CalculatorBloc();

  void _onButtonPressed(String value) {
    setState(
      () {
        if (value == Keys.clear.value || value == Keys.clearAll.value) {
          _calculatorBloc.add(ClearCalculation());
        } else if (value == Keys.equals.value) {
          _calculatorBloc.add(CalculateResult());
        } else if (value == Keys.backspace.value) {
          _calculatorBloc.add(BackspacePressed());
        } else if (Keys.operators.contains(value)) {
          _calculatorBloc.add(OperatorPressed(operator: value));
        } else {
          _calculatorBloc.add(NumberPressed(number: value));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: BlocProvider<CalculatorBloc>(
        create: (context) => _calculatorBloc,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF363435), Color(0xFF201D1E), Colors.black],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(child: Display()),
                Expanded(
                  flex: 2,
                  child: Keypad(_onButtonPressed),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
