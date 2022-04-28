import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:loggy/loggy.dart';
import 'package:animal/injector.dart' as injector;

class DevelopmentInterceptor extends Interceptor {
  final Loggy _loggy = injector.serviceLocator.get<Loggy>();

  DevelopmentInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!kReleaseMode) {
      this._loggy.debug("[${options.method}]: ${options.uri}");
      this._loggy.debug(options.headers);
      this._loggy.debug(options.data);
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!kReleaseMode) {
      this._loggy.debug(response.statusCode);
      this._loggy.debug(response.data);
    }

    super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (!kReleaseMode) {
      this._loggy.debug(err.stackTrace);

      this._loggy.debug(err.response?.statusCode);
      this._loggy.debug(err.response?.data);
    }

    return handler.next(err);
  }
}
