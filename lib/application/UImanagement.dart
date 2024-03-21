import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:redresq_app/application/navbar.dart';
import 'package:redresq_app/location/location_service.dart';

class StartUI extends StatelessWidget {
  const StartUI({super.key});

  @override
  Widget build(BuildContext context) {
    logLog();

    return const MaterialApp(
        home: NavBar(
      isOnline: true,
      isRestricted: false,
    ));
  }
}

class StartUIOffline extends StatelessWidget {
  const StartUIOffline({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: NavBar(
      isOnline: false,
      isRestricted: false,
    ));
  }
}

class StartUIRestricted extends StatelessWidget {
  const StartUIRestricted({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: NavBar(
      isOnline: true,
      isRestricted: true,
    ));
  }
}

Future<void> logLog() async{
  var locService = LocationService();
  final token = await FirebaseMessaging.instance.getToken();
  var loc = await locService.getCurrentLocation();

  locService.logLocation(loc.longitude, loc.latitude, token);
}

