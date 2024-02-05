import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:redresq_app/notifications/notification_helper_android.dart';
import 'package:redresq_app/location/location_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

Future<void> setup() async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    var title = message.data["title"];
    var desc = message.data["desc"];

    var notificationHelper = NotificationHelperAndroid();

    notificationHelper.showWarning(title, desc);

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.instance.onTokenRefresh
      .listen((fcmToken) async {
    var locServ = LocationService();
    var loc = await locServ.getCurrentLocation();

    locServ.logLocation(loc.longitude, loc.latitude, fcmToken);
  });
}

Future<void> requestPermissions() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');
}