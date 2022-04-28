import 'package:animal/constants/preferences_constants.dart';
import 'package:animal/network/endpoints.dart';
import 'package:animal/network/interceptors/authentication_interceptor.dart';
import 'package:animal/network/interceptors/development_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animal/injector.dart' as injector;

class BaseApi {
  final dio = injector.serviceLocator.get<Dio>();
  final loggy = injector.serviceLocator.get<Loggy>();
  final SharedPreferences _sharedPreferences = injector.serviceLocator.get<SharedPreferences>();

  Future<String> endpoint(String path) async {
    var isBaseUrl = this._sharedPreferences.getString(PreferencesConstants.BASE_URL);

    return "${Endpoints.local}$path";
  }

  BaseApi() {
    dio.interceptors.clear();
    dio.interceptors.add(AuthenticationInterceptor());
    dio.interceptors.add(DevelopmentInterceptor());

    dio.options.headers.addAll({"Content-Type": "application/json"});

    dio.options.receiveTimeout = 20000;
    dio.options.sendTimeout = 20000;
    dio.options.connectTimeout = 20000;
    dio.options.followRedirects = false;
  }
}
