import 'package:animal/models/user/user.dart';
import 'package:animal/network/base_api.dart';
import 'package:animal/network/endpoints.dart';

class UserApi extends BaseApi {
  Future<User> getMe() async {
    try {
      String url = await endpoint(Endpoints.me);

      final response = await dio.get(
        url,
      );

      return User.fromJson(response.data);
    } catch (err) {
      throw err;
    }
  }
}
