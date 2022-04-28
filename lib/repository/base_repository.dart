import 'package:shared_preferences/shared_preferences.dart';
import 'package:animal/injector.dart' as injector;

class BaseRepository {
  final sharedPreferences = injector.serviceLocator.get<SharedPreferences>();
}
