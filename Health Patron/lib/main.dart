import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/ambulance_list/ambulance_list_stream.dart';
import 'package:flash_chat/screens/bmi_calculator/function_page.dart';
import 'package:flash_chat/screens/clinic_list/clinic_list_stream.dart';
import 'package:flash_chat/screens/covid-stats/homepage.dart';
import 'package:flash_chat/screens/dashboard/dashboard_menu.dart';
import 'package:flash_chat/screens/hospital_list/hospital_list_stream.dart';
import 'package:flutter/material.dart';

import 'screens/chat/chat_screen.dart';
import 'screens/chat/login_screen.dart';
import 'screens/chat/registration_screen.dart';
import 'screens/chat/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MessageApp());
}

class MessageApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(
            child: Text(
              'Has error',
              textDirection: TextDirection.ltr,
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            initialRoute: WelcomeScreen.id,
            routes: {
              WelcomeScreen.id: (context) => WelcomeScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              RegistrationScreen.id: (context) => RegistrationScreen(),
              DashboardMenu.id: (context) => DashboardMenu(),
              ChatScreen.id: (context) => ChatScreen(),
              FunctionPage.id: (context) => FunctionPage(),
              HomePage.id: (context) => HomePage(),
              AmbulanceListStream.id: (context) => AmbulanceListStream(),
              HospitalListStream.id: (context) => HospitalListStream(),
              ClinicListStream.id: (context) => ClinicListStream(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(
          child: Text(
            'Loading',
            textDirection: TextDirection.ltr,
          ),
        );
      },
    );
  }
}
