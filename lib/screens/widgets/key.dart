import 'package:flutter/material.dart';

import 'package:flutter_calculator/models/key_symbol.dart';

abstract class Keys {
  static final KeySymbol clear = const KeySymbol('C');
  static final KeySymbol clearAll = const KeySymbol('AC');
  static final KeySymbol backspace = const KeySymbol('DEL');
  static final KeySymbol percent = const KeySymbol('%');
  static final KeySymbol divide = const KeySymbol('÷');
  static final KeySymbol multiply = const KeySymbol('x');
  static final KeySymbol subtract = const KeySymbol('-');
  static final KeySymbol add = const KeySymbol('+');
  static final KeySymbol equals = const KeySymbol('=');
  static final KeySymbol decimal = const KeySymbol('.');

  static final KeySymbol zero = const KeySymbol('0');
  static final KeySymbol one = const KeySymbol('1');
  static final KeySymbol two = const KeySymbol('2');
  static final KeySymbol three = const KeySymbol('3');
  static final KeySymbol four = const KeySymbol('4');
  static final KeySymbol five = const KeySymbol('5');
  static final KeySymbol six = const KeySymbol('6');
  static final KeySymbol seven = const KeySymbol('7');
  static final KeySymbol eight = const KeySymbol('8');
  static final KeySymbol nine = const KeySymbol('9');

  static List<String> operators = [
    add.value,
    subtract.value,
    multiply.value,
    divide.value
  ];
}

class CalculatorKey extends StatelessWidget {
  final KeySymbol symbol;
  final VoidCallback onPressed;

  CalculatorKey({required this.symbol, required this.onPressed});

  ButtonStyle get style {
    switch (symbol.value) {
      case '=':
        return ElevatedButton.styleFrom(
          elevation: 0.0,
          primary: Color(0xFFFFCC00),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        );

      default:
        return ElevatedButton.styleFrom(
            elevation: 0.0, primary: Colors.transparent);
    }
  }

  Color get textColor {
    switch (symbol.type) {
      case KeyType.FUNCTION:
        return Colors.white;

      case KeyType.OPERATOR:
        if (symbol.value == '=') return Colors.white;
        return Color(0xFFFFCC00);

      case KeyType.INTEGER:
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.all(6.0),
        child: ElevatedButton(
            onPressed: onPressed,
            onLongPress: onPressed,
            style: style,
            child: _setChild(symbol)),
      ),
    );
  }

  Widget _setChild(KeySymbol symbol) {
    if (symbol == Keys.backspace) {
      return Icon(
        Icons.backspace_outlined,
      );
    }

    return Text(
      symbol.value,
      style: TextStyle(
        color: textColor,
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
