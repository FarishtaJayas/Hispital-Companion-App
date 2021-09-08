import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/ambulance_list/ambulance_list_stream.dart';
import 'package:flash_chat/screens/bmi_calculator/function_page.dart';
import 'package:flash_chat/screens/chat/chat_screen.dart';
import 'package:flash_chat/screens/clinic_list/clinic_list_stream.dart';
import 'package:flash_chat/screens/covid-stats/homepage.dart';
import 'package:flash_chat/screens/hospital_list/hospital_list_stream.dart';
import 'package:flash_chat/widgets/menu_tile.dart';
import 'package:flutter/material.dart';

class DashboardMenu extends StatelessWidget {
  static String id = "dashboard_menu";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveColor,
      appBar: AppBar(
        backgroundColor: kInactiveColor,
        title: Text('Health Patron'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                MenuTile(
                  childWidget: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ChatScreen.id);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'images/doctor.png',
                            height: 65,
                            width: 80,
                          ),
                        ),
                        Text(
                          'Live Chat',
                          style: kDashboardFont,
                        ),
                        SizedBox(
                          height: 25.0,
                        )
                      ],
                    ),
                  ),
                ),
                MenuTile(
                  childWidget: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, HospitalListStream.id);
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            'images/hospital.png',
                            height: 90,
                            width: 100,
                          ),
                        ),
                        Text(
                          'Hospitals',
                          style: kDashboardFont,
                        ),
                        SizedBox(
                          height: 25.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              MenuTile(
                childWidget: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AmbulanceListStream.id);
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'images/ambulance.png',
                          height: 65,
                          width: 85,
                        ),
                      ),
                      Text(
                        'Ambulance',
                        style: kDashboardFont,
                      ),
                      SizedBox(
                        height: 25.0,
                      )
                    ],
                  ),
                ),
              ),
              MenuTile(
                childWidget: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ClinicListStream.id);
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'images/clinic.png',
                          height: 65,
                          width: 85,
                        ),
                      ),
                      Text(
                        'Clinics',
                        style: kDashboardFont,
                      ),
                      SizedBox(
                        height: 25.0,
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              MenuTile(
                childWidget: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, HomePage.id);
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'images/statistics.png',
                          height: 65,
                          width: 85,
                        ),
                      ),
                      Text(
                        'COVID-Stats',
                        style: kDashboardFont,
                      ),
                      SizedBox(
                        height: 25.0,
                      )
                    ],
                  ),
                ),
              ),
              MenuTile(
                childWidget: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, FunctionPage.id);
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'images/calculator.png',
                          height: 65,
                          width: 85,
                        ),
                      ),
                      Text(
                        'BMI',
                        style: kDashboardFont,
                      ),
                      SizedBox(
                        height: 25.0,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
