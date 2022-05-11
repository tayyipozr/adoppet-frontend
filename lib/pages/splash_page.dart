import 'package:animal/pages/homepage/auth/signin_page.dart';
import 'package:animal/pages/homepage/home_page.dart';
import 'package:animal/services/push_notification_service.dart';
import 'package:animal/stores/notification_store.dart';
import 'package:animal/stores/root_store.dart';
import 'package:animal/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animal/injector.dart' as injector;

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late UserStore _userStore;
  late NotificationStore _notificationStore;
  late PushNotificationService _notificationService;

  @override
  void initState() {
    super.initState();

    () async {
      await Future.delayed(Duration.zero);
      await _redirect();
    }();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    RootStore rootStore = Provider.of<RootStore>(context);
    _userStore = rootStore.userStore;
    _notificationService = injector.serviceLocator.get<PushNotificationService>();
    _notificationStore = rootStore.notificationStore;
  }

  Future<void> _redirect() async {
    await _userStore.getMe();
    if (_userStore.user != null) {
      String? token = _notificationService.token;
      if (token == null) token = await _notificationService.getToken();

      await _notificationStore.initializeToken(token);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SigninPage()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Page"),
      ),
    );
  }
}
