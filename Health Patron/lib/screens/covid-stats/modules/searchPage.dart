import 'dart:convert';

import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/covid-stats/modules/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=deaths');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveColor,
      appBar: AppBar(
        backgroundColor: kInactiveColor,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              color: kBottomContainerColor,
              onPressed: () {
                showSearch(context: context, delegate: Search(countryData));
              })
        ],
        title: Text('COVID-19 Stats'),
      ),
      body: countryData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    color: kInactiveColor,
                    child: Container(
                      height: 130,
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: kActiveColor,
                          spreadRadius: 3,
                          offset: Offset(0, 3),
                        )
                      ]),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  countryData[index]['country'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70),
                                ),
                                Image.network(
                                  countryData[index]['countryInfo']['flag'],
                                  height: 50.0,
                                  width: 60.0,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Confirmed: ' +
                                      countryData[index]['cases'].toString(),
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Cases Today: ' +
                                      countryData[index]['todayCases']
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Recovered: ' +
                                      countryData[index]['recovered']
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.green.shade400,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Deaths: ' +
                                      countryData[index]['deaths'].toString(),
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Deaths Today: ' +
                                      countryData[index]['todayDeaths']
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    ));
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
