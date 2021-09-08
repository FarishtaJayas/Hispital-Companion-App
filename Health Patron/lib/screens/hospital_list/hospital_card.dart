import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  final String title;
  final String subtitle;

  HospitalCard({@required this.title, @required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: Image.asset('images/listhospital.png'),
            title: Text(title),
            subtitle: Text(subtitle),
          ),
          Center(
            child: ButtonBar(
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.call,
                    color: kBottomContainerColor,
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.directions,
                    color: kBottomContainerColor,
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.web,
                    color: kBottomContainerColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
