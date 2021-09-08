import 'package:flash_chat/constants.dart';
import 'package:flash_chat/widgets/text_box.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 100.0,
                  ),
                ),
                SizedBox(
                  width: 3.0,
                ),
                Text(
                  'Health Patron',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            TextBox(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              color: kBottomContainerColor,
              title: 'Login',
            ),
            TextBox(
                color: Colors.red,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                title: 'Register')
          ],
        ),
      ),
    );
  }
}
