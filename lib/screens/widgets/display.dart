import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_calculator/bloc/calculator_bloc.dart';
import 'package:flutter_calculator/bloc/calculator_state.dart';

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
      return Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: 80,
              child: SingleChildScrollView(
                reverse: true,
                child: Text(
                  state.history,
                  maxLines: 1000,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(
                  state.primaryText,
                  maxLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: 60),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              state.secondaryText,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ],
        ),
      );
    });
  }
}
