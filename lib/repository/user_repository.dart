import 'package:animal/models/user/user.dart';
import 'package:animal/network/apis/user_api.dart';
import 'package:animal/repository/base_repository.dart';

class UserRepository extends BaseRepository {
  UserApi _userApi;

  UserRepository(this._userApi);

  Future<User> getMe() async {
    try {
      return await _userApi.getMe();
    } catch (err) {
      throw err;
    }
  }
}
