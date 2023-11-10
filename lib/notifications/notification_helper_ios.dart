/*import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelperIOS {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificationHelperIOS() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true);
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNoInternetNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'no_internet_channel',
      'Keine Internetverbindung',
      channelDescription:
      'Benachrichtigung bei fehlender Internetverbindung',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
      icon: '@mipmap/ic_launcher',
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Keine Internetverbindung',
      'Bitte überprüfen Sie Ihre Internetverbindung.',
      platformChannelSpecifics,
      payload: 'no_internet_payload',
    );
  }
}*/
