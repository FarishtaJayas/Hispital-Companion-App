import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  final Widget childWidget;
  MenuTile({this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: childWidget,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: kActiveColor,
        ),
      ),
    );
  }
}
