import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final Color chooseColor;
  final Widget childWidget;

  ReusableContainer({this.childWidget, @required this.chooseColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: chooseColor,
      ),
    );
  }
}
