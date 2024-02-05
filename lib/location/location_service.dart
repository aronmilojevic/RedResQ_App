import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:redresq_app/application/UIManagement.dart';
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
      final String? token = await fetchAuthToken();

      if (token != null) {
        final apiUrl = 'https://api.redresq.at/auth/register?lon=$longitude&lat=$latitude';

        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {
            HttpHeaders.authorizationHeader:
            "bearer $token",
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: notificationToken,
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


  Future<String?> fetchAuthToken() async {
    final apiUrl = 'https://api.redresq.at/guest/request';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
      );

      if (response.statusCode == 200) {
        final String authToken = response.body;
        return authToken;
      } else {
        print('Fehler beim Abrufen des Authentifizierungstokens: ${response.statusCode}');
        print('API-Antwort: ${response.body}');
        return null;
      }
    } catch (error) {
      print('Netzwerkfehler beim Abrufen des Authentifizierungstokens: $error');
      return null;
    }
  }
}