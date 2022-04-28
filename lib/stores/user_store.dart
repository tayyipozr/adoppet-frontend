import 'package:animal/core/utils/error_handling_store_mixin.dart';
import 'package:animal/models/user/user.dart';
import 'package:animal/repository/user_repository.dart';
import 'package:animal/stores/state_store.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store, HandleError {
  final UserRepository _userRepository;

  _UserStore(this._userRepository);

  final getMeState = StateStore();

  @observable
  User? user;

  Future<void> getMe() async {
    getMeState.resetLoading();
    try {
      getMeState.startLoading();
      user = await _userRepository.getMe();
      getMeState.finishLoading();
    } on DioError catch (error) {
      handleStoreError(getMeState, error);
    }
  }
}
