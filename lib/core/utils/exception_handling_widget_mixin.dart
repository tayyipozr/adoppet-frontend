import 'package:animal/stores/root_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:animal/injector.dart' as injector;

mixin HandleExceptions {
  void handleWidgetExceptions(BuildContext context, Object err) async {
    var rootStore = injector.serviceLocator.get<RootStore>();

    // Session Dropped

    if (err is DioError) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Err'),
              content: Text('Dio error'),
            );
          }).then((value) {
        // Navigator.of(context).pushNamedAndRemoveUntil(NavigationConstants.SMS_CODE_PAGE, (route) => false);
      });
    }

    return showDialog(
        context: context,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            backgroundColor: Colors.red,
            title: Text('Err'),
            content: Text('another error' + err.toString()),
          );
        }).then((value) {
      // Navigator.of(context).pushNamedAndRemoveUntil(NavigationConstants.SMS_CODE_PAGE, (route) => false);
    });
  }

  Widget showErrorMessage(BuildContext context, String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {}
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      });
    }
    return SizedBox.shrink();
  }
}
