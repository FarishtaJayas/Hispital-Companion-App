import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String labelText;

  IconContent({@required this.icon, @required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 60.0,
          color: Colors.white70,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(labelText, style: kLabelTextStyle),
      ],
    );
  }
}
