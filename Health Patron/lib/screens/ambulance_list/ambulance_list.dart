import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class AmbulanceList extends StatelessWidget {
  static String id = "ambulance_list";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          padding: EdgeInsets.only(top: 40.0),
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Ambulance',
                style: TextStyle(color: Colors.white70, fontSize: 45.0),
              ),
            ),
            AmbulanceCard(
              title: 'Square Hospital',
              subtitle: 'Dhaka, Ashulia Hwy, Dhaka 1230',
            ),
            AmbulanceCard(
              title: 'Air Ambulance in Bangladesh ',
              subtitle: 'Holding 16, Road 36, 1st floor, Dhaka 1212',
            ),
            AmbulanceCard(
              title: 'Desh Ambulance Service',
              subtitle: '82 East Ahmed Nagor, Dhaka 1216',
            ),
            AmbulanceCard(
              title: 'Square Air Limited',
              subtitle:
                  'Square Centre 48, Mohakhali C/A, Bir Uttam AK Khandakar Rd, Dhaka 1212',
            )
          ],
        ),
      ),
    );
  }
}

class AmbulanceCard extends StatelessWidget {
  final String title;
  final String subtitle;

  AmbulanceCard({@required this.title, @required this.subtitle});

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
            leading: Image.asset('images/ambulance.png'),
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
          )
        ],
      ),
    ));
  }
}
