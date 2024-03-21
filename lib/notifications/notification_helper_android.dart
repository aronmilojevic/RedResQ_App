import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelperAndroid {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  NotificationHelperAndroid() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    var initializationSettingsAndroid =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNoInternetNotification() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
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
    var platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Keine Internetverbindung',
      'Bitte überprüfen Sie Ihre Internetverbindung.',
      platformChannelSpecifics,
      payload: 'no_internet_payload',
    );
  }

  // Wird nicht gebraucht wird vom Server ausgesendet
  // Für die einzelnen Katastrofen
  Future<void> showEarthquakeWarning() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'earthquake_warning',
      'Warnung!',
      channelDescription:
      'Benachrichtigung bei eintreffenden Erdbeben',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
      icon: '@mipmap/ic_launcher',
    );
    var platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Warnung',
      'An earthquake takes place',
      platformChannelSpecifics,
      payload: 'no_internet_payload',
    );
  }

  Future<void> showWarning(var title, var desc) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'warning',
      title,
      channelDescription:
      desc,
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
      icon: '@mipmap/ic_launcher',
    );

    var platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      desc,
      platformChannelSpecifics,
      payload: 'no_internet_payload',
    );
  }
}
