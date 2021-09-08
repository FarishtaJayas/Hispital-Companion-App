import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class AmbulanceListStream extends StatefulWidget {
  static String id = "ambulance_list_stream";
  @override
  _AmbulanceListStreamState createState() => _AmbulanceListStreamState();
}

class _AmbulanceListStreamState extends State<AmbulanceListStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('ambulance').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: CircularProgressIndicator(),
          );
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('loading');
          }
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kInactiveColor,
            title: Text('Ambulance'),
            actions: [
              Icon(
                Icons.search,
                color: kBottomContainerColor,
              )
            ],
          ),
          backgroundColor: kInactiveColor,
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: new ListView(
                        children:
                            snapshot.data.docs.map((DocumentSnapshot document) {
                          return Card(
                              child: Padding(
                            padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                new ListTile(
                                  leading: Image.asset('images/ambulance.png'),
                                  title: new Text(document.data()['title']),
                                  subtitle:
                                      new Text(document.data()['subtitle']),
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
                        }).toList(),
                      ),
                    ),
                  ),
                ]),
          ),
        );
      },
    );
  }
}
