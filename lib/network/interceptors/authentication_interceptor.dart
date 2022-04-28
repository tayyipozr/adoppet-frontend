import 'package:animal/constants/preferences_constants.dart';
import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';
import 'package:animal/injector.dart' as injector;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationInterceptor extends Interceptor {
  final Loggy _loggy = injector.serviceLocator.get<Loggy>();
  final SharedPreferences _sharedPreferences = injector.serviceLocator.get<SharedPreferences>();

  AuthenticationInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? token = this._sharedPreferences.getString(PreferencesConstants.TOKEN);

    _loggy.debug('Authorization token is ' + (token ?? '-'));

    if (token != null) {
      options.headers.putIfAbsent('Authorization', () => 'Bearer ' + token);
    }

    super.onRequest(options, handler);
  }
}
