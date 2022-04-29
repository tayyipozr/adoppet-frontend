import 'package:firebase_messaging/firebase_messaging.dart';

abstract class IPushNotificationService {
  Stream<RemoteMessage>? onMessage;
  Future<void> setup();
  Future<void> requestPermisson();
}
