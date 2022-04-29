import 'package:animal/services/push_notification_service_abstract.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:animal/injector.dart' as injector;
import 'package:loggy/loggy.dart';

class PushNotificationService extends IPushNotificationService {
  String? token;

  Future<void> setup() async {
    await Firebase.initializeApp();
    await requestPermisson();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    token = await messaging.getToken();
    injector.serviceLocator.get<Loggy>().debug("PushNotificationToken: $token");
  }

  Future<void> requestPermisson() async {
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }
}
