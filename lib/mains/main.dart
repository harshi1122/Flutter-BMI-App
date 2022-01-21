import 'package:flutter/material.dart';
import 'inputs.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.light(
          primary: Color(0xFF000000),
        ),
        scaffoldBackgroundColor: Color(0xFF000000),
      ),
      home: InputPage(),

    );
  }
}
