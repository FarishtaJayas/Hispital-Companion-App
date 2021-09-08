import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData chooseIcon;
  final Function pressMe;

  RoundIconButton({@required this.chooseIcon, @required this.pressMe});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressMe,
      child: Icon(
        chooseIcon,
        size: 15,
      ),
      constraints: BoxConstraints.tightFor(
        width: 36.0,
        height: 36.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
