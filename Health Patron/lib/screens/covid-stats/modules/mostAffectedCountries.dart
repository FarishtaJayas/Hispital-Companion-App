import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List countryData;

  const MostAffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              children: <Widget>[
                Image.network(
                  countryData[index]['countryInfo']['flag'],
                  height: 25.0,
                  width: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  countryData[index]['country'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white70),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Deaths: ' + countryData[index]['deaths'].toString(),
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                )
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
