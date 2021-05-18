import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_calculator/screens/calculator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter calculator',
      // home: Calculator(),
      home: Expanded(
        child: DevicePreview(
          enabled: true,
          builder: (context) => Calculator(),
        ),
      ),
    );
  }
}
