import 'package:animal/stores/state_store.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

mixin HandleError on Store {
  void handleStoreError(StateStore stateStore, DioError error) {
    var err = error.response!.data["message"];
    String errorMessage = "";
    if (err is List) {
      errorMessage = err[0];
    } else if (err is String) {
      errorMessage = err;
    }
    stateStore.setErrorMessage(errorMessage);
    stateStore.state = LoadingState.error;
  }
}
