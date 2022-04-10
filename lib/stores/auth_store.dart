import 'package:animal/core/utils/error_handling_store_mixin.dart';
import 'package:animal/models/user/user.dart';
import 'package:animal/repository/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store, HandleError {
  final UserRepository _userRepository;

  _AuthStore(this._userRepository);

  @observable
  User? user;

  Future<void> getUser() async {
    if (user == null) user = _userRepository.user;
  }
}
