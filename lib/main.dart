import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:redresq_app/application/UIManagement.dart';
import 'package:redresq_app/login_register/start_page.dart';
import 'package:redresq_app/components/phone_information.dart';
import 'package:redresq_app/login_register/start_page_2.0.dart';
import 'package:redresq_app/notifications/notification_helper_android.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:redresq_app/login_register/Profile/userprofile_drawer.dart';


/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedUsername = prefs.getString('username');
  String? savedPassword = prefs.getString('password');
  String? expirationDateString = prefs.getString('expirationDate');

  if (savedUsername != null && savedPassword != null && expirationDateString != null) {
    DateTime expirationDate = DateTime.parse(expirationDateString);

    // Schauen ob das Ablaufdatum noch nicht erreicht ist
    if (DateTime.now().isBefore(expirationDate)) {
      // Benutzer automatisch anmelden
      runApp(
        MaterialApp(
          home: StartUI(),
        ),
      );
      return;
    }
  }
  // Anmeldeseite anzeigen
  runApp(
    MaterialApp(
      home: GetStartedPage2(),
    ),
  );
}

*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Erstelle eine GlobalKey für das Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Weise die GlobalKey dem Scaffold zu
      appBar: AppBar(
        title: Text('My App'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Verwende die GlobalKey, um auf das ScaffoldState zuzugreifen
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      body: Center(
        child: Text('Dashboard'),
      ),
      drawer: MyDrawer(),
    );
  }
}




