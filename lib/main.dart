import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:redresq_app/login_register/start_page.dart';
import 'package:redresq_app/components/phone_information.dart';
import 'package:redresq_app/notifications/notification_helper_android.dart';
import 'dart:io';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Verbindung
  var connectivityResult = await (Connectivity().checkConnectivity());

  // Betriebssystem
  if (Platform.isAndroid) {
    platformName = 'Android';
  } else if (Platform.isIOS) {
    platformName = 'iOS';
  }

  if ((connectivityResult != ConnectivityResult.mobile) ||
      (connectivityResult != ConnectivityResult.wifi)) {
    runApp(
      MaterialApp(
        home: GetStartedPage(),
      ),
    );
  } else {
    // Keine Internetverbindung
    // Benachrichtigung über das Handy, dass keine Internetverbindung besteht
    NotificationHelperAndroid().showNoInternetNotification();
    /*if(platformName == 'Android'){
        NotificationHelperAndroid().showNoInternetNotification();
    }
    else{
      // IOS Notification fehlt
    }*/
  }
}
