import 'dart:convert';

import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/covid-stats/modules/mostAffectedCountries.dart';
import 'package:flash_chat/screens/covid-stats/modules/searchPage.dart';
import 'package:flash_chat/screens/covid-stats/modules/selectedCountry.dart';
import 'package:flash_chat/screens/covid-stats/modules/worldStats.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  static String id = "homepage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=deaths');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Map bangladeshData;
  fetchBangladeshData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries/Bangladesh');
    setState(() {
      bangladeshData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    fetchBangladeshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveColor,
      appBar: AppBar(
        backgroundColor: kInactiveColor,
        title: Text('COVID-19 Stats'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                'images/covidImage.png',
                width: 150.0,
                height: 150.0,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'World Stats',
                    style: kHeadingTextStyle,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryPage()));
                    },
                    color: kBottomContainerColor,
                    textColor: Colors.white,
                    disabledColor: Colors.white,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.white,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: Text(
                      'Search',
                      style: kHeadingTextStyle.copyWith(
                          fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            worldData == null
                ? CircularProgressIndicator()
                : WorldStats(
                    worldData: worldData,
                  ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                'Bangladesh Stats',
                style: kHeadingTextStyle,
              ),
            ),
            bangladeshData == null
                ? CircularProgressIndicator()
                : SelectedCountry(
                    bangladeshData: bangladeshData,
                  ),
            Container(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                'Most Affected Countries',
                style: kHeadingTextStyle,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            countryData == null
                ? Container()
                : MostAffectedPanel(
                    countryData: countryData,
                  ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
