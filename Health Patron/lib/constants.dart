import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: kBottomContainerColor,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: kBottomContainerColor, width: 2.0),
  ),
);

const kInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white70,
  hintText: 'Enter your email',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kInactiveColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kInactiveColor, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kContainerColor = Color(0xFF262A4D);
const kBackGroundColor = Color(0xFF111639);
const kScaffoldColor = Color(0xFF111639);
const kAppbarColor = Color(0xFF111639);
const kBottomContainerColor = Color(0xFFEB1555);
const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFFA0A2B2),
);
const kFontStyleBody = TextStyle(
    fontSize: 38.5, fontWeight: FontWeight.w900, color: Colors.white70);

const Color kInactiveColor = Color(0xFF111328);
const Color kActiveColor = Color(0xFF1D1E33);
const Color maleColor = kInactiveColor;
const Color femaleColor = kInactiveColor;
const Color otherColor = kInactiveColor;

const kTitleTextStyle = TextStyle(
    fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white70);
const kResultsPageStyle = TextStyle(
    color: Color(0xFF24D876), fontSize: 22.0, fontWeight: FontWeight.bold);

const kBMITextStyle = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 40.0, color: Colors.white70);
const kBodyTextStyle = TextStyle(fontSize: 22.0, color: Colors.white70);
const kDashboardFont = TextStyle(fontSize: 22.0, color: Colors.white70);

const kTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0);
const kHeadingTextStyle =
    TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold);
