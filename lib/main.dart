import 'package:animal/navigation_routes.dart';
import 'package:animal/pages/homepage/auth/signin_page.dart';
import 'package:animal/pages/homepage/auth/signup_page.dart';
import 'package:animal/pages/homepage/home_page.dart';
import 'package:animal/pages/splash_page.dart';
import 'package:animal/stores/root_store.dart';
import 'package:flutter/material.dart';
import 'package:animal/injector.dart' as injector;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector.init();
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
