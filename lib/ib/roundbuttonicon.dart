import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  RoundIconButton({this.child, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      onPressed: onPressed,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}