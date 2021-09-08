import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonText});

  final Function onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonText,
            style: kFontStyleBody.copyWith(fontSize: 25.0),
          ),
        ),
        margin: EdgeInsets.all(15.0),
        height: 60.0,
        width: double.infinity,
        color: kBottomContainerColor,
      ),
    );
  }
}
