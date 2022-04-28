import 'package:animal/core/utils/error_handling_store_mixin.dart';
import 'package:animal/models/auth/auth.dart';
import 'package:animal/models/auth/token.dart';
import 'package:animal/pages/homepage/auth/signin_page.dart';
import 'package:animal/repository/auth_repository.dart';
import 'package:animal/stores/state_store.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store, HandleError {
  final AuthRepository _authRepository;

  _AuthStore(this._authRepository);

  final signupState = StateStore();
  final signinState = StateStore();

  @observable
  Token? token;

  Future<void> signup(Auth auth) async {
    signupState.resetLoading();
    try {
      signupState.startLoading();
      token = await _authRepository.signup(auth);
      signupState.finishLoading();
    } on DioError catch (error) {
      handleStoreError(signupState, error);
    }
  }

  Future<void> signin(Auth auth) async {
    signinState.resetLoading();
    try {
      signinState.startLoading();
      token = await _authRepository.signin(auth);
      signinState.finishLoading();
    } on DioError catch (error) {
      handleStoreError(signinState, error);
    }
  }
}
