import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:redresq_app/application/UIManagement.dart';
import 'package:redresq_app/shared/app_information.dart';

import 'package:redresq_app/components/my_snackbars.dart';

class LocationService {
  Location location = Location();

  Future<LocationData> getCurrentLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null!;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null!;
      }
    }

    return await location.getLocation();
  }

  Future<void> logLocation(var longitude, var latitude, var notificationToken) async {
    try {
      AppInformation.initialize();
      final String? userToken = await AppInformation.getUserToken();

      if (userToken != null) {
        final apiUrl = 'https://api.redresq.at/coordinates/log?lon=$longitude&lat=$latitude';

        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {
            HttpHeaders.authorizationHeader:
            "bearer $userToken",
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: jsonEncode(notificationToken),
        );

        if (response.statusCode == 200) {
          print('Benutzer erfolgreich erstellt');
        } else {
          print('Fehler bei der Benutzererstellung: ${response.statusCode}');
          print('API-Antwort: ${response.body}');
        }
      }
    } catch (error) {
      print('Netzwerkfehler: $error');
    }
  }

}