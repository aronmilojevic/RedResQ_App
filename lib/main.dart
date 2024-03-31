import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:redresq_app/application/UIManagement.dart';
import 'package:redresq_app/login_register/start_page_2.0.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:redresq_app/shared/app_information.dart';
import 'firebase_options.dart';
import 'package:redresq_app/notifications/notification_handler.dart';
import 'dart:ui' as ui;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationHandler().initNotifications();

  print(ui.window.locale.toString());
  if (await checkInternetConnection() == true) {
    AppInformation.initialize();
    // Token erhalten
    String? token = AppInformation.getUserToken();
    // Prüfen ob der Token noch gültig ist
    if (await checkUserToken(token) == true) {
      // Wenn ja, wird das Login übersprungen
      runApp(
        MaterialApp(
          home: StartUI(),
        ),
      );
    } else {
      // Token nicht gültig also neu anmelden oder registrieren
      runApp(
        MaterialApp(
          home: GetStartedPage2(),
        ),
      );
    }
  } else {
    // Kein Internet, also kommt man in die Offline-App
    runApp(
      MaterialApp(
        home: StartUIOffline(),
      ),
    );
  }
}


Future<bool> checkUserToken(String? token) async {
  final apiUrl = 'https://api.redresq.at/auth/checktoken';

  try {
    final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          HttpHeaders.authorizationHeader:
          "bearer $token",
          HttpHeaders.contentTypeHeader: "application/json",
        }
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Fehler beim Abrufen des Authentifizierungstokens: ${response.statusCode}');
      print('API-Antwort: ${response.body}');
      return false;
    }
  } catch (error) {
    print('Netzwerkfehler beim Abrufen des Authentifizierungstokens: $error');
    return false;
  }
}

Future<bool> checkInternetConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}
