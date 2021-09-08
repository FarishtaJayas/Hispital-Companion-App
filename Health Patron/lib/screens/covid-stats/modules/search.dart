import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List countryList;

  Search(this.countryList);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: kInactiveColor,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Card(
              color: kActiveColor,
              child: Container(
                height: 130,
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                            suggestionList[index]['country'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                          ),
                          Image.network(
                            suggestionList[index]['countryInfo']['flag'],
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
                                suggestionList[index]['cases'].toString(),
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Cases Today: ' +
                                suggestionList[index]['todayCases'].toString(),
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Recovered: ' +
                                suggestionList[index]['recovered'].toString(),
                            style: TextStyle(
                                color: Colors.green.shade400,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Deaths: ' +
                                suggestionList[index]['deaths'].toString(),
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Deaths Today: ' +
                                suggestionList[index]['todayDeaths'].toString(),
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
        });
  }
}
