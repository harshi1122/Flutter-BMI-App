import 'package:flutter/material.dart';
import '../mains/constants.dart';

class IconContent extends StatelessWidget {
  final Icon icon;
  final String label;
  IconContent({this.label, this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        SizedBox(height: 15.0),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}