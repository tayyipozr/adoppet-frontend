import 'package:animal/navigation_routes.dart';
import 'package:animal/pages/splash_page.dart';
import 'package:animal/services/push_notification_service_abstract.dart';
import 'package:animal/stores/root_store.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:animal/injector.dart' as injector;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.init();
  IPushNotificationService _pushNotificationService = injector.serviceLocator.get<IPushNotificationService>();
  await _pushNotificationService.setup();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  runApp(AnimalApp());
}

class AnimalApp extends StatefulWidget {
  const AnimalApp({Key? key}) : super(key: key);

  @override
  _AnimalAppState createState() => _AnimalAppState();
}

class _AnimalAppState extends State<AnimalApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: injector.serviceLocator.get<RootStore>()),
      ],
      child: Observer(
        builder: (BuildContext context) => MaterialApp(
          title: 'Flutter Demo',
          theme: context.watch<RootStore>().coreStore.themeData,
          onGenerateRoute: injector.serviceLocator.get<NavigationRoute>().generateRoute,
          home: SplashPage(),
        ),
      ),
    );
  }
}
